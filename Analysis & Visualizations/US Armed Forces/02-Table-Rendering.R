library(dplyr)
library(tidyr)
library(stringr)
library(knitr)

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
