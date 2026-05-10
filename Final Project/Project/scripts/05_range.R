# Author: Evan
# Reviewer: Ian
# Description: Creates histogram of EV electric range (excluding 0 values) to examine distribution of driving range.

# Plot 5: Electric range distribution
# Electric range of 0 usually means unknown/not researched, so this plot removes 0s.
plot_range <- ev |>
  filter(electric_range > 0) |>
  ggplot(aes(x = electric_range)) +
  geom_histogram(binwidth = 10, color = "white") +
  geom_vline(aes(xintercept = median(electric_range)), linetype = "dashed", linewidth = 1) +
  scale_y_continuous(labels = label_number(scale_cut = cut_short_scale())) +
  labs(
    title = "Reported electric range varies widely",
    subtitle = "Only records with electric range greater than 0 are included",
    x = "Electric range, miles",
    y = "Number of registered EVs"
  ) +
  theme_minimal(base_size = 13)

print(plot_range)
ggsave("figures/05_range_histogram.png", plot_range, width = 9, height = 5.4, dpi = 300)
