# Intro-to-R

A personal R programming repository containing data analyses, simulations, and visualizations built throughout coursework at Penn State. Projects span web scraping, data wrangling, Monte Carlo methods, and exploratory data analysis, all written in idiomatic Tidyverse R

---

## Repository Structure

```
Intro-to-R/
├── Analysis & Visualizations/
│   ├── Aviation Traffic Analysis/
│   │   ├── 01-DataPrep.R
│   │   ├── 02-Tidying.R
│   │   └── 03-Plotting.R 
│   ├── Diamonds Challenge/
│   │   ├── 01-Tidying.R 
│   │   └── 02-Visualization.R
│   ├── Galton Family Data/
│   │   └── DataWrangling.R
|   ├── Global Hub Analysis & Stochastic Modeling
│   │   ├── Analyzing Calcium 
│   │   ├── Hub-Analysis---Stochastic-Modeling.pdf
│   │   ├── Hub-Analysis-Stochastic-Modeling.qmd
│   │   ├── README.md
│   │   └── plan.md
│   ├── US Armed Forces/
│   │   ├── 01-Wrangling-Cleaning.R
│   │   └── 02-Table-Rendering.R
│   └── Understanding Pirates/
│       └── Visualization.R
├── Simulations/
│   ├── Dice Roller/
│   │   ├── 01-Intro.R
│   │   └── 02-Simulation-&-Table-Rendering.R
│   └── Monte Carlo Simulation/
│       ├── 01-Intro.R
│       ├── 02-Wrangling-&-Plot.R
│       └── 03-Final-Visualization.R
└── Final Project/
    ├── Project/
    │   ├── data
    │   ├── figures
    │   ├── quarto
    |   └── scripts
    ├── README.md
    └── Project_Guidelines.md
```

---

## Getting Started

### Prerequisites

- [R](https://cran.r-project.org/) (≥ 4.1 recommended)
- [RStudio](https://posit.co/download/rstudio-desktop/)

### Install Required Packages

```r
install.packages(c(
  "tidyverse", "ggplot2", "rvest", "gt", "knitr",
  "googlesheets4", "yarrr", "patchwork", "scales", "devtools"
))
```

### Running a Script

1. Open RStudio and set your working directory to the script's folder:  
   `Session > Set Working Directory > To Source File Location`
2. Open and run the script with `Ctrl+Shift+Enter` (Run All).

For the Final Project Quarto report, place `Electric_Vehicle_Population_Data.csv` in the same directory as the `.qmd` file before rendering.

---

## Skills Demonstrated

| Area | Tools / Techniques |
|---|---|
| Data wrangling | `pivot_longer/wider`, `separate_*`, `mutate`, `filter`, `join` |
| Web scraping | `rvest` — HTML tables from Wikipedia and static pages |
| External data | `googlesheets4` — reading Google Sheets without auth |
| Visualization | `ggplot2` — bar, line, scatter, histogram, heatmap |
| Tables | `gt`, `knitr::kable` — publication-quality tables |
| Simulation | Monte Carlo integration, dice rolling, `replicate`, `sample` |
| Reproducibility | Quarto (`.qmd` → PDF), script-level style guides, code headers |
| Functions | Input validation, roxygen2 docs, modular helper functions |

---
