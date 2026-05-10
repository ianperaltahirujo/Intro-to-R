# Author: Ian
# Reviewer: Evan
# Description: Creates bar chart of most common EV make and model combinations to analyze market leaders.

# Plot 4: Top make/model combinations

plot_top_models <- ev |>
  count(make_model, sort = TRUE) |>
  slice_head(n = 10) |>
  mutate(make_model = fct_reorder(make_model, n)) |>
  ggplot(aes(x = n, y = make_model)) +
  geom_col() +
  geom_text(aes(label = comma(n)), hjust = -0.1, size = 3.5) +
  scale_x_continuous(
    labels = label_number(scale_cut = cut_short_scale()),
    expand = expansion(mult = c(0, 0.12))
  ) +
  labs(
    title = "Top models are mostly battery electric vehicles",
    x = "Number of registered EVs",
    y = "Make and model"
  ) +
  theme_minimal(base_size = 13) +
  theme(panel.grid.major.y = element_blank())

print(plot_top_models)
ggsave("figures/04_top_models.png", plot_top_models, width = 9, height = 5.4, dpi = 300)
