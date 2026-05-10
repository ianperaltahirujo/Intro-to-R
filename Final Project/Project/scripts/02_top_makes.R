# Author: Ian
# Reviewer: Evan
# Description: Creates bar chart of top EV makes to identify dominant manufacturers in the dataset.

# Plot 2: Top makes

plot_top_makes <- ev |>
  count(make, sort = TRUE) |>
  slice_head(n = 10) |>
  mutate(make = fct_reorder(make, n)) |>
  ggplot(aes(x = n, y = make)) +
  geom_col() +
  geom_text(aes(label = comma(n)), hjust = -0.1, size = 3.5) +
  scale_x_continuous(
    labels = label_number(scale_cut = cut_short_scale()),
    expand = expansion(mult = c(0, 0.12))
  ) +
  labs(
    title = "Tesla is the dominant make in this EV population",
    x = "Number of registered EVs",
    y = "Make"
  ) +
  theme_minimal(base_size = 13) +
  theme(panel.grid.major.y = element_blank())

print(plot_top_makes)
ggsave("figures/02_top_makes.png", plot_top_makes, width = 9, height = 5.4, dpi = 300)
