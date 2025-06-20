#!/usr/bin/env bash
# Start R plumber backend
Rscript -e "pr <- plumber::plumb('api/plumber.R'); pr$run(host='0.0.0.0', port=8000)" &
# Start Next.js frontend
cd frontend
if [ ! -d "node_modules" ]; then
  yarn install
fi
yarn build
yarn start -p 3000 --hostname 0.0.0.0 &
wait -n
