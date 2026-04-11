# --- Data Wrangling ---

# Loading libraries
library(dplyr)
library(ggplot2)

mc_sim_data <- generate_mc_simulation(n = 1000, x_min = 0, x_max = 4, y_min = 0, y_max = 0.8)
mc_wrangled <- mc_sim_data |>
  mutate(
    # Identify if the point is below or on the function curve
    # Using the assigned Weibull parameters
    status = if_else(y <= dweibull(x, shape = 1.5, scale = 1), "Below/On", "Above")
  )

# Calculation of Estimated Integration
# Total area of the sampling rectangle: (4 - 0) * (0.8 - 0)
rect_area <- 3.2
proportion_hits <- mean(mc_wrangled$status == "Below/On")
mc_estimate <- rect_area * proportion_hits

# Display the numerical estimate
mc_estimate

ggplot(mc_wrangled, aes(x = x, y = y)) +
  # Plot the random points colored by their hit/miss status
  geom_point(aes(color = status), alpha = 0.5) +
  # Layer the Weibull PDF for comparison
  stat_function(
    fun = dweibull,
    args = list(shape = 1.5, scale = 1),
    xlim = c(0, 4),
    linewidth = 1,
    color = "black"
  ) +
  # Apply labels
  scale_color_manual(values = c("Below/On" = "red", "Above" = "gray")) +
  theme_minimal() +
  labs(
    title = paste("Monte Carlo Integration Estimate (n =", unique(mc_wrangled$n_resolution), ")"),
    subtitle = paste("Estimated Area:", round(mc_estimate, 4)),
    x = "x",
    y = "f(x)",
    color = "Point Location",
    caption = "Function: Weibull PDF (shape=1.5, scale=1)"
  ) +
  theme(plot.title = element_text(face = "bold"))
