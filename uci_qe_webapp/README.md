# UCI QE Duolingo-style Webapp

This repo combines:

* **Plumber API** (R) in `api/` for running code and returning flashcards.
* **Next.js frontend** in `frontend/` for a gamified interface.
* **Dockerfile** for a full-stack container (R, Quarto, Node).
* **start.sh** launches both backend (port 8000) and frontend (port 3000).

## Quickstart (Docker)

```bash
docker build -t uci-qe-web .
docker run -e API_TOKEN=mytoken -p 3000:3000 -p 8000:8000 uci-qe-web
```

Set the `API_TOKEN` environment variable to secure the `/runCode` endpoint.
Then navigate to `http://localhost:3000`.
