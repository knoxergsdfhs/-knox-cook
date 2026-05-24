@echo off
setlocal
cd /d "%~dp0"
set LOGFILE=..\cook-deploy-log.txt
echo. > "%LOGFILE%"
echo === COOK DEPLOY STARTED at %DATE% %TIME% === >> "%LOGFILE%"
git config user.email "ken.grover@acadianasystems.com" >> "%LOGFILE%" 2>&1
git config user.name "Ken Grover" >> "%LOGFILE%" 2>&1
git add -A >> "%LOGFILE%" 2>&1
git commit -m "cook: deploy" >> "%LOGFILE%" 2>&1
git push origin main >> "%LOGFILE%" 2>&1
git log -1 --oneline >> "%LOGFILE%" 2>&1
echo === DONE === >> "%LOGFILE%"
type "%LOGFILE%"
endlocal
