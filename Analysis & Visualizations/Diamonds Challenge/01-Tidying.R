# The Diamonds Challenge ---
library(tidyverse)
library(knitr)

newDiamonds <- diamonds |>
  filter(x != 0, y != 0, z != 0) |>
  select(cut, x, y, z)

calc_stats <- function(df, col_name) {
  df |>
    group_by(Cut = cut) |>
    summarize(
      Variable = col_name,
      count    = n(),
      Min      = min(.data[[col_name]]),
      Q1       = quantile(.data[[col_name]], 0.25),
      Med      = median(.data[[col_name]]),
      SAM      = mean(.data[[col_name]]),
      Q3       = quantile(.data[[col_name]], 0.75),
      Max      = max(.data[[col_name]]),
      MAD      = mad(.data[[col_name]]),
      SASD     = sd(.data[[col_name]]),
      .groups  = "drop"
    )
}

stats_x <- calc_stats(newDiamonds, "x")
stats_y <- calc_stats(newDiamonds, "y")
stats_z <- calc_stats(newDiamonds, "z")

final_table <- bind_rows(stats_x, stats_y, stats_z)
final_table


# Calculate the descriptive statistics for price by clarity
diamonds_summary <- diamonds |>
  group_by(Clarity = clarity) |>
  summarize(
    Count          = n(),
    Min            = min(price),
    `1st Quintile` = quantile(price, probs = 0.20),
    `2nd Quintile` = quantile(price, probs = 0.40),
    Median         = median(price),
    `3rd Quintile` = quantile(price, probs = 0.60),
    `4th Quintile` = quantile(price, probs = 0.80),
    Max            = max(price),
    SAM            = mean(price),
    SASD           = sd(price),
    .groups        = "drop"
  )

# Render the final table
kable(
  diamonds_summary,
  digits = 2,
  caption = "Descriptive Statistics for Diamond Price by Clarity Level"
)
