@echo off
REM Spacebar Stack Launcher — runs Spacebar server + SSH tunnel
REM ============================================================================
REM Launched from Startup folder. Runs minimized via VBS wrapper.
REM Each component runs in its own hidden window with auto-restart (loop).

cd /d "E:\BackusData\Documents\github\spacebar"

REM Ensure logs directory exists
if not exist "logs" mkdir "logs"

REM ── 1. Start SSH Tunnel (autossh-style: reconnect loop) ──────────────────
REM We loop so if the tunnel drops, it reconnects
start /min "SpacebarTunnel" cmd /c ^
  ":tunnel^
  echo [%date% %time%] Starting SSH tunnel... >> "logs\tunnel.log"^
  "C:\Program Files\Git\usr\bin\ssh.exe" -i "C:\Users\TBA\.ssh\oracle_vps" ^
    -o StrictHostKeyChecking=no ^
    -o ServerAliveInterval=30 ^
    -o ServerAliveCountMax=3 ^
    -o ExitOnForwardFailure=yes ^
    -o TCPKeepAlive=yes ^
    -N -R 0.0.0.0:3001:localhost:3001 ubuntu@129.153.156.190 >> "logs\tunnel.log" 2>&1^
  echo [%date% %time%] Tunnel exited, reconnecting in 5s... >> "logs\tunnel.log"^
  timeout /t 5 /nobreak >nul^
  goto tunnel"

REM ── 2. Start Spacebar Server (auto-restart loop) ────────────────────────
set NODE_ENV=production
set PORT=3001
set DATABASE=postgres://spacebar_admin:***@127.0.0.1:5432/spacebar

start /min "SpacebarServer" cmd /c ^
  ":server^
  echo [%date% %time%] Starting Spacebar... >> "logs\server.log"^
  "C:\Program Files\nodejs\node.exe" --enable-source-maps dist/bundle/start.js >> "logs\server.log" 2>&1^
  echo [%date% %time%] Server exited, restarting in 3s... >> "logs\server.log"^
  timeout /t 3 /nobreak >nul^
  goto server"

echo Spacebar stack launch complete.
exit /b 0
