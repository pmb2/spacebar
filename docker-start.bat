@echo off
REM ============================================================================
REM Spacebar Docker — Auto-Start Script (production)
REM ============================================================================
REM Called from Windows startup — brings up the full stack.
REM Container restart policies handle crashes; this handles boot.
REM ============================================================================
setlocal

cd /d "E:\BackusData\Documents\github\spacebar" || (
    echo [ERROR] Could not find spacebar project directory
    pause
    exit /b 1
)

REM Load environment variables from .env
if not exist ".env" (
    echo [ERROR] Missing .env file — run setup-env.sh first
    pause
    exit /b 1
)

echo [%date% %time%] Starting Spacebar stack...

REM Ensure Docker Desktop is running — start it if not
docker info >nul 2>&1
if %ERRORLEVEL% neq 0 (
    echo [WARN] Docker not running. Launching Docker Desktop...
    start "" "C:\Program Files\Docker\Docker\Docker Desktop.exe"
    echo [WAIT] Giving Docker 30 seconds to start...
    timeout /t 30 /nobreak >nul
)

REM Bring up the full stack (postgres + spacebar)
echo [%date% %time%] docker compose up -d
docker compose -f docker-compose.yml --env-file .env up -d

if %ERRORLEVEL% equ 0 (
    echo [OK] Spacebar stack is running.
    echo      Postgres: internal service
    echo      Spacebar: http://localhost:3001
    echo      Public:   https://discy.backus.agency
) else (
    echo [ERROR] docker compose failed with exit code %ERRORLEVEL%
)

endlocal
