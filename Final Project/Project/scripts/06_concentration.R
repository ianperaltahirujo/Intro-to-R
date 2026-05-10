# Author: Ian
# Reviewer: Evan
# Description: Creates heatmap of EV counts by county and make to explore how manufacturers are distributed geographically.

# Plot 6: County by make heat map
top_county_names <- ev |>
  count(county, sort = TRUE) |>
  slice_head(n = 6) |>
  pull(county)

top_make_names <- ev |>
  count(make, sort = TRUE) |>
  slice_head(n = 6) |>
  pull(make)

plot_county_make_heatmap <- ev |>
  filter(county %in% top_county_names, make %in% top_make_names) |>
  count(county, make) |>
  mutate(
    county = factor(county, levels = rev(top_county_names)),
    make = factor(make, levels = top_make_names)
  ) |>
  ggplot(aes(x = make, y = county, fill = n)) +
  geom_tile(color = "white") +
  geom_text(aes(label = label_number(scale_cut = cut_short_scale())(n)), size = 3.2) +
  scale_fill_continuous(labels = label_number(scale_cut = cut_short_scale())) +
  labs(
    title = "Top makes are not spread evenly across counties",
    x = "Make",
    y = "County",
    fill = "EV count"
  ) +
  theme_minimal(base_size = 13) +
  theme(panel.grid = element_blank())

print(plot_county_make_heatmap)
ggsave("figures/06_county_make_heatmap.png", plot_county_make_heatmap, width = 9, height = 5.4, dpi = 300)
