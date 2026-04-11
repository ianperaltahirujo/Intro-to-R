library(devtools)

#' Random Coordinate Generator for Monte Carlo Integration
#'
#' This function generates a set of random (x, y) coordinate pairs within
#' specified boundaries to be used in a Monte Carlo simulation.
#'
#' @param n The total number of points (resolution) to be simulated.
#' @param x_min The lower bound of the x-axis for the simulation window.
#' @param x_max The upper bound of the x-axis for the simulation window.
#' @param y_min The lower bound of the y-axis for the window.
#' @param y_max The upper bound of the y-axis (the height of the box).
#'
#' @return A data frame with x and y coordinates and the resolution label.
#' @export
#'
#' @examples
#' generate_mc_simulation(100, 2, 6, 0, 4)


## Monte Carlo Simulation for Numerical Integration ---

# Generating (x, y) pairs within specified bounds
generate_mc_simulation <- function(n, x_min, x_max, y_min, y_max) {

  # Randomly sample n coordinates using a uniform distribution
  x_coords <- runif(n, min = x_min, max = x_max)
  y_coords <- runif(n, min = y_min, max = y_max)

  # Join these two samples together into one data frame
  sim_data <- data.frame(
    x = x_coords,
    y = y_coords,
    n_resolution = n
  )

  return(sim_data)
}
