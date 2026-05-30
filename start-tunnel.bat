@echo off
REM Spacebar SSH Tunnel — Windows Service Wrapper
REM Forwards VPS port 3001 → localhost:3001 so discy.backus.agency reaches Spacebar
REM Used by nssm — auto-restarts on tunnel drop
REM ============================================================================

set SSH_KEY=C:\Users\TBA\.ssh\oracle_vps
set SSH_HOST=ubuntu@129.153.156.190

"C:\Program Files\Git\usr\bin\ssh.exe" -i "%SSH_KEY%" ^
  -o StrictHostKeyChecking=no ^
  -o ServerAliveInterval=30 ^
  -o ServerAliveCountMax=3 ^
  -o ExitOnForwardFailure=yes ^
  -o TCPKeepAlive=yes ^
  -N -R 0.0.0.0:3001:localhost:3001 %SSH_HOST%
