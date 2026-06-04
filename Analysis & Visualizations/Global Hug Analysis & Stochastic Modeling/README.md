# Global Hub Analysis & Stochastic Modeling

A reproducible data science report built with **Quarto** that covers three
interconnected analyses: global airport passenger traffic recovery (2020-2025),
Monte Carlo numerical integration, and a structured evaluation of generative AI
prompting quality on longitudinal data.

---

## Key Findings

**Airport Recovery Analysis**
- Domestic-focused hubs (ATL, DFW) maintained comparatively high volumes
  throughout the 2020-2025 period, benefiting from resilient local demand.
- International transit hubs (LHR, PKX) showed significant data gaps during
  peak lockdown years, reflecting the asymmetric impact of regional travel
  restrictions on hub-dependent airports.
- DXB demonstrated the steepest international rebound of the six airports
  studied, nearly quadrupling its 2020 passenger volume by 2025.

**Monte Carlo Integration**
- A Weibull PDF (shape = 1.5, scale = 1) was used as the integration target,
  with a theoretical area of exactly 1.0.
- Estimates at n = 10 and n = 100 show high variance and poor curve definition;
  by n = 10,000 the simulated point cloud closely approximates the true curve
  and the estimate converges near the theoretical value.
- This convergence analysis concretely illustrates the relationship between
  sample size and estimator reliability in stochastic methods.

**Structured vs. Generic AI Prompting**
- A plan-informed prompt, which explicitly defined treatment group structure and
  wrangling steps, produced a correctly labeled spaghetti plot with group-mean
  overlays respecting the study design.
- A generic prompt produced a valid but less accurate visualization that relied
  on the model inferring column groupings, leading to ambiguous cohort labels.
- Finding: explicit data context and stepwise logic passed to a generative AI
  tool substantially reduces the risk of silent misinterpretation in data
  wrangling tasks.

---

## Technical Stack

| Tool | Purpose |
|---|---|
| R / tidyverse | Data wrangling and transformation |
| ggplot2 | Visualization (spaghetti plots, recovery trajectories) |
| rvest | Web scraping Wikipedia passenger traffic tables |
| gt | Publication-quality summary tables |
| Quarto | Reproducible PDF report generation |

---

## Data Sources

- **Airport traffic (2020-2025):** Scraped from Wikipedia's
  [List of busiest airports by passenger traffic](https://en.wikipedia.org/wiki/List_of_busiest_airports_by_passenger_traffic).
  No authentication required; data is publicly accessible.
- **Calcium dataset:** `calcium.csv` - a longitudinal dataset of ulnar calcium
  measurements across 15-16 subjects in two treatment groups (Null vs.
  Diet/Exercise) over four time points (Initial, Year 1, Year 2, Year 3).
  Provided as course material.

---

## Repo Structure

```
Global Hub Analysis & Stochastic Modeling/
├── Hub-Analysis-Stochastic-Modeling.qmd   # Source document
├── Hub-Analysis-Stochastic-Modeling.pdf   # Rendered report
├── plan.md                                # Project and repo plan
├── README.md
└── Analyzing Calcium/
    ├── AnalyzingCalcium.R                 # Standalone calcium analysis script
    ├── calcium.csv                        # Longitudinal calcium dataset
    └── images/                            # Plot outputs and comparison figures
```

---

## Reproducing the Report

1. Clone the repository and open the project in RStudio or a Quarto-compatible
   environment.
2. Install required R packages:
   ```r
   install.packages(c("tidyverse", "rvest", "gt", "ggplot2"))
   ```
3. Render the report:
   ```bash
   quarto render Hub-Analysis-Stochastic-Modeling.qmd
   ```
   The airport scraping step requires an active internet connection. All other
   analyses run fully offline from local data.

---
