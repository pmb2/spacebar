#!/bin/bash
# Start Spacebar natively with DATABASE env var from .env
cd "$(dirname "$0")"
export $(grep -v '^\s*#' .env | xargs)
export DATABASE="postgres://${POSTGRES_USER}:${POSTGRES_PASSWORD}@127.0.0.1:5432/${POSTGRES_DB:-spacebar}"
exec node --enable-source-maps dist/bundle/start.js
