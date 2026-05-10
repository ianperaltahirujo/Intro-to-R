# Author: Evan
# Reviewer: Ian
# Description: Creates time series plot of EV registrations by model year and EV type (BEV vs PHEV).

# Plot 3: Model year by EV type

plot_model_year_type <- ev |>
  filter(model_year >= 2011, model_year <= 2027) |>
  count(model_year, ev_type_short) |>
  ggplot(aes(x = model_year, y = n, color = ev_type_short, shape = ev_type_short)) +
  geom_line(linewidth = 1.1) +
  geom_point(size = 2) +
  scale_y_continuous(labels = label_number(scale_cut = cut_short_scale())) +
  labs(
    title = "Newer model years make up most registered EVs",
    x = "Model year",
    y = "Number of registered EVs",
    color = "EV type",
    shape = "EV type"
  ) +
  theme_minimal(base_size = 13) +
  theme(legend.position = "top")

print(plot_model_year_type)
ggsave("figures/03_model_year_by_type.png", plot_model_year_type, width = 9, height = 5.4, dpi = 300)
