# 🎓 UCI Stats QE Weapon Repo (Patched 2025)

Complete, examiner‑proof study package for the Data‑Analysis Qualifying Exam (Master’s/PhD Year‑1) at **UCI Department of Statistics**.

*Built 2025‑06‑16 07:38 UTC*

## Quick Start

```bash
# restore packages & build report
R -e "install.packages('renv'); renv::restore(); targets::tar_make()"

# or run in Docker
make rsession   # browse http://localhost:8787  (user: rstudio / pw: stats)
```

## Contents

| folder | purpose |
|--------|---------|
| `R/` | helper functions (QIC selection, missing‑data tools, diagnostics, theme) |
| `data/` | realistic synthetic datasets incl. primary `CVH_SleepVaso.csv` |
| `docs/` | past exam summaries, bootcamp, rubric, pro tips, data dictionary |
| `.github/workflows/` | CI pipeline: restore env, run tests, render PDF |
| `_targets.R` | parameterised pipeline (multiple datasets) |
| `report.qmd` | Quarto template with conditional sections |
| `Dockerfile` / `docker-compose.yml` | reproducible environment |
| `tests/` | unit tests for helper functions |

Everything aligns to 2016‑2024 exam patterns, STAT 210A/B/C syllabus, and Fitzmaurice/Laird & Ware methodology.
