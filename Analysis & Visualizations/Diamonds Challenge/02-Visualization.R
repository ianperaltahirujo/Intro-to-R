# UNDERSTANDING DIAMONDS ---

# Load libraries
library(tidyverse)
library(ggplot2)

diamonds %>%
  # Group by cut to ensure we sample from every category
  group_by(cut) %>%

  # Subset to 600 diamonds per cut for a cleaner plot
  slice_sample(n = 600) %>%

   # Make the plot with carat on x and price on y
  ggplot(aes(x = carat, y = price, color = cut)) +
  geom_point(alpha = 0.4, size = 0.8) +

   # Apply log-10 scales for a linear carat-price relationship
  scale_x_log10() +
  scale_y_log10() +

  # Add linear trend lines
  geom_smooth(method = "lm") +

   # Adding labels
  labs(
    title = "Diamond Price by Carat and Cut",
    x = "Carat Weight",
    y = "Price in USD",
    color = "Cut Quality"
  )

# This command saves the plot you just made
ggsave(
  filename = "diamonds_plot.png",
  plot = last_plot(),       # Grabs the last plot shown in RStudio
  width = 10,               # 10 inches wide
  height = 7,               # 7 inches tall
  units = "in",             # Defining the units as inches
  dpi = 300                 # High resolution
)
