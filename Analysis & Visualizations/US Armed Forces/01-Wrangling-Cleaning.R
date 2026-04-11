library(googlesheets4)
library(dplyr)
library(tidyr)
library(rvest)
library(stringr)
library(knitr)

# 1. Load Data
gs4_deauth()
armed_durl <- read_sheet(
  ss = 'https://docs.google.com/spreadsheets/d/19xQnI1cBh6Jkw7eP8YQuuicMlVDF7Gr-nXCb5qbwb_E/edit?usp=sharing',
  skip = 3,
  col_names = FALSE,
  col_types = "c"
)

colnames(armed_durl) <- c(
  "pay_grade",
  "Army_Male", "Army_Female", "Army_Total",
  "Navy_Male", "Navy_Female", "Navy_Total",
  "Marine Corps_Male", "Marine Corps_Female", "Marine Corps_Total",
  "Air Force_Male", "Air Force_Female", "Air Force_Total",
  "Space Force_Male", "Space Force_Female", "Space Force_Total",
  "Total_Male", "Total_Female", "Total_Total"
)

# 2. Wrangle Personnel Data
armed_tidy <- armed_durl %>%
  select(!contains("Total")) %>%
  filter(!grepl("Total", pay_grade)) %>%
  pivot_longer(cols = -pay_grade, names_to = "branch_sex", values_to = "count") %>%
  separate_wider_delim(branch_sex, delim = "_", names = c("branch", "sex")) %>%
  mutate(
    count = as.numeric(gsub("[^0-9]", "", as.character(count))),
    pay_grade = str_squish(pay_grade),
    branch = str_squish(branch)
  ) %>%
  filter(!is.na(count), count > 0)

# 3. Scrape and Prep Rank Lookup
rank_url <- "https://neilhatfield.github.io/Stat184_PayGradeRanks.html"
rank_raw <- read_html(rank_url) %>%
  html_table(header = FALSE) %>%
  .[[1]]

# Select specific column positions and name them to bypass bad HTML headers
rank_lookup <- rank_raw %>%
  select(
    pay_grade = 2,
    Army = 3,
    Navy = 4,
    `Marine Corps` = 5,
    `Air Force` = 6,
    `Space Force` = 7
  ) %>%
  slice(-(1:2)) %>% #
  pivot_longer(cols = -pay_grade, names_to = "branch", values_to = "rank") %>%
  mutate(
    pay_grade = str_squish(pay_grade),
    branch = str_squish(branch)
  )

# 4. Join and Uncount
armed_forces_final <- armed_tidy %>%
  left_join(rank_lookup, by = c("pay_grade", "branch")) %>%
  uncount(count)

View(armed_forces_final)

# 1. Filter the dataset to include only Enlisted Service Members
enlisted_forces <- armed_forces_final %>%
  filter(str_detect(pay_grade, "^E"))

# 2. Create and Render the Male Frequency Table
male_freq_table <- enlisted_forces %>%
  filter(sex == "Male") %>%
  count(pay_grade, rank, branch) %>%
  # Pivot to create columns for each branch
  pivot_wider(names_from = branch, values_from = n, values_fill = 0) %>%
  # Sort the table by Pay Grade
  arrange(pay_grade)

# Render the male table
kable(male_freq_table, caption = "Frequency of Male Enlisted Service Members by Rank and Branch")

# 3. Create and Render the Female Frequency Table
female_freq_table <- enlisted_forces %>%
  filter(sex == "Female") %>%
  count(pay_grade, rank, branch) %>%
  # Pivot to create columns for each branch
  pivot_wider(names_from = branch, values_from = n, values_fill = 0) %>%
  # Sort the table by Pay Grade
  arrange(pay_grade)

# Render the female table
kable(female_freq_table, caption = "Frequency of Female Enlisted Service Members by Rank and Branch")
