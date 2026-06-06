#!/bin/bash
cd /e/BackusData/Documents/github/spacebar
source .env
# Build the database URL properly
DB="postgres://${POSTGRES_USER}"
DB="${DB}:***@127.0.0.1:5432/spacebar"
export DATABASE="${DB}"
export CONFIG_PATH="${CONFIG_PATH:-$(pwd)/config.production.json}"
export PORT="${PORT:-3100}"
exec node --enable-source-maps dist/bundle/start.js
