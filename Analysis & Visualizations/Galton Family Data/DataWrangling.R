library(tidyverse)
library(googlesheets4)

# 1. Load Data
gs4_deauth()
galton_raw <- read_sheet(
  ss = 'https://docs.google.com/spreadsheets/d/1ZA83iqkojBVX0bvtXQ-wuCyR6oswZwJMORRb-VK2ktM/edit?usp=sharing',
  col_types = "c"
)

# 2. Wrangle Data
galton_final <- galton_raw %>%
  # Pivot the children columns into a single "sex" and "height" column
  pivot_longer(
    cols = c(`Sons in order of height`, `Daughters in order of height`),
    names_to = "sex",
    values_to = "height"
  ) %>%
  # Split the comma-separated strings into rows
  separate_longer_delim(height, delim = ", ") %>%
  # Filter out rows that are empty
  filter(!is.na(height), height != "NULL") %>%
  mutate(
    Father = parse_number(Father) + 60,
    Mother = parse_number(Mother) + 60,
    height = parse_number(height) + 60,
    # Simplify the sex column to just "M" and "F"
    sex = ifelse(sex == "Sons in order of height", "M", "F")
  )

# 3. Result
View(galton_final)
