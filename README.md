# QE Sniper

This repository contains two components for preparing UCI Statistics Qualifying Exams:

- **uci_qe_weapon_repo_patched_final** – an R package with helper functions, sample datasets and a Quarto report pipeline.
- **uci_qe_webapp** – a Dockerized web application exposing an API and Next.js frontend.

## Setup

1. Unzip the subprojects if they are not already extracted:
   ```bash
   unzip uci_qe_weapon_repo_patched_final.zip -d uci_qe_weapon_repo_patched_final
   unzip uci_qe_webapp.zip -d uci_qe_webapp
   ```
2. Follow the README in each directory for details on building the report or running the web application.

## Continuous Integration

The workflow in `uci_qe_weapon_repo_patched_final/.github/workflows/render.yml` installs dependencies, runs unit tests and renders the Quarto report. It triggers on pushes and pull requests.

## License

This project is licensed under the MIT License. See [LICENSE](LICENSE) for details.
