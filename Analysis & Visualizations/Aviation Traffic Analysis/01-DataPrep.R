# Load table package
library(gt)
# Prepare data for the table
table_data <- busiest_airports_tidy |>
  # Convert passengers to Millions for readability
  mutate(Passengers_M = Passengers / 1e6) |>
  select(Airport, IATA, Year, Passengers_M) |>
  pivot_wider(names_from = Year, values_from = Passengers_M) |>
  # Arrange by the most recent data year (2025) descending
  arrange(desc(`2025`))

# Generate the polished gt table
table_data |>
  gt() |>
  tab_header(
    title = "Annual Passenger Traffic at Global Hubs (2020-2025)",
    subtitle = "Volume measured in Millions of Passengers (M)"
  ) |>
  fmt_number(
    columns = matches("202"),
    decimals = 1
  ) |>
  cols_label(
    IATA = "IATA Code"
  ) |>
  tab_source_note(
    source_note = "Source: Wikipedia (List of busiest airports by passenger traffic)"
  ) |>
  tab_options(
    table.width = pct(100),
    column_labels.font.weight = "bold",
    heading.title.font.size = px(22),
    table.background.color = "white"
  ) |>
  tab_style(
    style = cell_text(weight = "bold", color = "darkblue"),
    locations = cells_body(columns = IATA)
  )
