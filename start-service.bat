@echo off
REM Spacebar Server — Windows Service Wrapper
REM Used by nssm to run Spacebar as a persistent Windows service
REM ============================================================================

set NODE_ENV=production
set PORT=3001
set DATABASE=postgres://spacebar_admin:***@127.0.0.1:5432/spacebar

cd /d "E:\BackusData\Documents\github\spacebar"

REM Run with logging to stdout (nssm captures this)
"C:\Program Files\nodejs\node.exe" --enable-source-maps dist/bundle/start.js
