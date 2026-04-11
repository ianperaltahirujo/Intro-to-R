# Load visualization library
library(ggplot2)

# Scale passengers to millions and ensure Year is numeric
plot_data <- busiest_airports_tidy |>
  mutate(
    Passengers_M = Passengers / 1e6,
    Year = as.numeric(Year)
  )

# Create the polished line graph
ggplot(plot_data, aes(x = Year, y = Passengers_M, color = IATA, group = IATA)) +
  # Adding lines to show the trajectory
  geom_line(linewidth = 1.2, alpha = 0.8) +
  # Adding points to mark the specific annual totals
  geom_point(size = 3) +
  # Applying a minimal theme
  theme_minimal() +
  # Customizing the x-axis to show every year clearly
  scale_x_continuous(breaks = 2020:2025) +
  # Formatting labels for clarity
  labs(
    title = "Recovery Trajectories of Global Airport Hubs (2020-2025)",
    subtitle = "Annual passenger traffic volume measured in Millions (M)",
    x = "Year",
    y = "Passengers (Millions)",
    color = "Airport (IATA)",
    caption = "Source: Wikipedia (List of busiest airports by passenger traffic)"
  )
