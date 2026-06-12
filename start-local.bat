@echo off
set DATABASE=postgres://spacebar_admin@localhost:5434/spacebar
set PORT=3100
set CONFIG_PATH=config.production.json
start /B node dist/bundle/start.js
