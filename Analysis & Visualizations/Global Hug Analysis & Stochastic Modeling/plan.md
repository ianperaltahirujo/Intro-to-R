# Project Plan

## Project Plan: Global Hub Analysis & Stochastic Modeling

**Goal:** Produce a fully reproducible Quarto report that analyzes global
airport passenger traffic recovery (2020–2025), demonstrates Monte Carlo
numerical integration, and evaluates the impact of structured GenAI prompting
on data analysis quality.

**Needs:**
- Wikipedia passenger traffic data (scraped via rvest)
- calcium.csv dataset for the longitudinal GenAI prompting case study
- R packages: tidyverse, rvest, gt, ggplot2
- Quarto installed and configured to render PDF output

**Steps:**
1. Scrape and tidy airport passenger data from Wikipedia
2. Build a comparative traffic table and recovery trajectory plot
3. Implement Monte Carlo integration for a Weibull PDF at four resolutions
4. Document a structured data wrangling plan for the calcium dataset
5. Prompt Claude with the plan and capture the result
6. Compare plan-informed vs. generic prompt outputs with narrative analysis
7. Write a reflection on reproducibility and GenAI prompting
8. Render the final PDF and verify all figures, tables, and code render cleanly

---

## Repo Plan: Version Control & Maintenance

**Goal:** Maintain a well-organized GitHub repository that demonstrates
professional version control practices throughout the project lifecycle.

**Needs:**
- GitHub repository with main and dev branches
- Issues system for tracking tasks and bugs
- Consistent commit message format following "If applied, this commit will…"

**Steps:**
1. Initialize the repo with a main branch and create a dev branch for active work
2. Create issues for each major task or fix before starting work on them
3. Apply appropriate labels to each issue
4. Make small, purposeful commits to the dev branch with imperative summary messages
5. Reference issue numbers in commit descriptions using "Closes #N" syntax
6. Open a pull request with a title and description when ready to merge dev into main
7. Confirm main is up-to-date after each merge
8. Keep the README updated to reflect the current state of the repo
