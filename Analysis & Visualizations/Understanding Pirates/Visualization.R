# UNDERSTANDING PIRATES ---

# Loading Libraries
library(yarrr)
library(ggplot2)

ggplot(data = pirates, aes(x = age, y = beard.length, color = sex)) +
  # Mapping variables and layering points with transparency
  geom_point(alpha = 0.5) +
  # 5. Adding a 'loess' smoothing line to capture the growth curve
  geom_smooth(method = "loess") +
  # 6. Labeling the plot with units
  labs(
    title = "Beard Length Among Pirates",
    x = "Pirate Age (Years)",
    y = "Beard Length (cm)",
    color = "Sex"
  )


# --------------------


# Polished Plot for Pirates
ggplot(data = pirates, aes(x = age, y = beard.length, color = sex)) +
  # Adding points with reduced alpha and size for overplotting
  geom_point(alpha = 0.3, size = 1.2) +
  geom_smooth(method = "loess", se = FALSE) +

  # Applying a minimal theme to remove the default gray grid for better contrast
  theme_minimal() +

  # Adding descriptive labels
  labs(
    title = "Beard Length Among Pirates",
    x = "Pirate Age (Years)",
    y = "Beard Length (cm)",
    color = "Sex",
  )
