# Author: Evan
# Reviewer: Ian
# Description: Creates bar chart of top 10 counties by EV registrations to analyze geographic concentration.

# Plot 1: Top counties

plot_top_counties <- ev |>
  count(county, sort = TRUE) |>
  slice_head(n = 10) |>
  mutate(county = fct_reorder(county, n)) |>
  ggplot(aes(x = n, y = county)) +
  geom_col() +
  geom_text(aes(label = comma(n)), hjust = -0.1, size = 3.5) +
  scale_x_continuous(
    labels = label_number(scale_cut = cut_short_scale()),
    expand = expansion(mult = c(0, 0.12))
  ) +
  labs(
    title = "EV registrations are concentrated in a few counties",
    x = "Number of registered EVs",
    y = "County"
  ) +
  theme_minimal(base_size = 13) +
  theme(panel.grid.major.y = element_blank())

print(plot_top_counties)
ggsave("figures/01_top_counties.png", plot_top_counties, width = 9, height = 5.4, dpi = 300)
