#!/bin/bash
# Start Spacebar natively with the correct DATABASE connection
cd /e/BackusData/Documents/github/spacebar
DATABASE="postgres://spacebar_admin:***@127.0.0.1:5432/spacebar" \
node --enable-source-maps dist/bundle/start.js
