# Busiest Passenger Airports ---
library(tidyverse)
library(rvest)

# Target IATA codes: ATL (Atlanta), FRA (Frankfurt), PKX (Beijing Daxing), DFW (Dallas), DXB (Dubai), LHR (London)
target_iata <- c("ATL", "FRA", "PKX", "DFW", "DXB", "LHR")
wiki_url <- "https://en.wikipedia.org/wiki/List_of_busiest_airports_by_passenger_traffic"

# Scrape all tables from the Wikipedia page
wp_page <- read_html(wiki_url)
all_tables <- html_elements(wp_page, "table.wikitable")

# Standardize column names and types across different annual tables
process_airport_table <- function(table_index, year_label) {
  all_tables[[table_index]] |>
    html_table() |>
    # Find columns regardless of specific Wikipedia header wording
    rename(Airport = matches("Airport"),
           Code = matches("Code|IATA|ICAO"),
           Passengers = matches("Passenger|Total")) |>
    select(Airport, Code, Passengers) |>
    mutate(
      Year = year_label,
      # Extract the 3-letter IATA code from strings
      IATA = str_sub(Code, 1, 3),
      Passengers = parse_number(as.character(Passengers))
    ) |>
    filter(IATA %in% target_iata)
}

# Iterate through the tables for 2020-2025
busiest_airports_tidy <- bind_rows(
  process_airport_table(1, 2025),
  process_airport_table(2, 2024),
  process_airport_table(3, 2023),
  process_airport_table(4, 2022),
  process_airport_table(5, 2021),
  process_airport_table(6, 2020)
) |>
  select(Airport, IATA, Year, Passengers) |>
  arrange(IATA, Year)

# Tidy Data Result
busiest_airports_tidy
