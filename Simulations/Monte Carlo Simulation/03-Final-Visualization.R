

# Loading libraries
library(tidyverse)
library(patchwork)

# Define a helper function to create each individual plot
make_mc_plot <- function(n_val) {

  # Generate simulation data
  sim_data <- generate_mc_simulation(n = n_val, x_min = 0, x_max = 4, y_min = 0, y_max = 0.8)

  # Wrangle and Calculate
  wrangled_data <- sim_data |>
    mutate(status = if_else(y <= dweibull(x, shape = 1.5, scale = 1), "Below/On", "Above"))

  estimate <- 3.2 * mean(wrangled_data$status == "Below/On")

  # Create the plot object
  p <- ggplot(wrangled_data, aes(x = x, y = y)) +
    geom_point(aes(color = status), alpha = 0.5, size = 0.8) +
    stat_function(fun = dweibull, args = list(shape = 1.5, scale = 1),
                  xlim = c(0, 4), color = "black", linewidth = 0.8) +
    scale_color_manual(values = c("Below/On" = "red", "Above" = "gray")) +
    theme_minimal() +
    labs(title = paste("n =", n_val),
         subtitle = paste("Est. Area:", round(estimate, 4)),
         x = NULL, y = NULL) +
    theme(legend.position = "none", plot.title = element_text(size = 10, face = "bold"))

  return(p)
}

# Create and save the four plot objects
plot10    <- make_mc_plot(10)
plot100   <- make_mc_plot(100)
plot1000  <- make_mc_plot(1000)
plot10000 <- make_mc_plot(10000)

# 4. Use {patchwork} to combine them into a single layout
plot10 + plot100 + plot1000 + plot10000 +
  plot_annotation(
    title = "Convergence of Monte Carlo Numerical Integration",
    subtitle = "Estimating the area under Weibull PDF (Shape=1.5, Scale=1)",
    caption = "As n increases, the estimate stabilizes around the true integral (1.0)."
  )
