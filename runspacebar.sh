#!/bin/bash
cd /e/BackusData/Documents/github/spacebar
source .env
export DATABASE="postgres://${POSTGRES_USER}:${POSTGRES_PASSWORD}@127.0.0.1:5432/spacebar"
exec node --enable-source-maps dist/bundle/start.js
