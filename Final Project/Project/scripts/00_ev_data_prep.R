library(tidyverse)
library(scales)

# Style Guide: Tidyverse Style Guide (https://style.tidyverse.org/)

# Author: Ian
# Reviewer: Evan
# Description: Loads, cleans, and prepares EV dataset for analysis. Renames variables,
# filters missing values, and creates derived variables used across all visualizations.

# 1. Put Electric_Vehicle_Population_Data.csv in the same folder as this script.
# 2. In RStudio, go to Session > Set Working Directory > To Source File Location.
# 3. Then run this whole script.

ev_raw <- read_csv("Electric_Vehicle_Population_Data.csv", show_col_types = FALSE)

ev <- ev_raw |>
  rename(
    vin = `VIN (1-10)`,
    county = County,
    city = City,
    state = State,
    postal_code = `Postal Code`,
    model_year = `Model Year`,
    make = Make,
    model = Model,
    ev_type = `Electric Vehicle Type`,
    cafv_eligibility = `Clean Alternative Fuel Vehicle (CAFV) Eligibility`,
    electric_range = `Electric Range`,
    legislative_district = `Legislative District`,
    dol_vehicle_id = `DOL Vehicle ID`,
    vehicle_location = `Vehicle Location`,
    electric_utility = `Electric Utility`,
    census_tract_2020 = `2020 Census Tract`
  ) |>
  filter(!is.na(county), !is.na(city), !is.na(electric_range)) |>
  mutate(
    make = str_to_title(make),
    model = str_to_title(model),
    make_model = str_c(make, model, sep = " "),
    ev_type_short = case_when(
      str_detect(ev_type, "BEV") ~ "Battery EV (BEV)",
      str_detect(ev_type, "PHEV") ~ "Plug-in Hybrid EV (PHEV)",
      TRUE ~ ev_type
    )
  )

# Create a folder for saved plots.
dir.create("figures", showWarnings = FALSE)

# Dataset summary
summary_table <- ev |>
  summarize(
    rows = n(),
    variables = ncol(ev_raw),
    earliest_model_year = min(model_year, na.rm = TRUE),
    newest_model_year = max(model_year, na.rm = TRUE),
    percent_battery_ev = round(mean(ev_type_short == "Battery EV (BEV)") * 100, 1)
  )

print(summary_table)
