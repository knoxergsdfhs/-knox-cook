@echo off
REM ============================================================
REM  Cook - first-time local git setup
REM ============================================================
setlocal
cd /d "%~dp0"

echo.
echo === Cook - first-time setup ===
echo.
echo Before running: create an empty repo on GitHub (no README, no license).
echo Suggested name: knox-cook
echo Copy the HTTPS URL (looks like: https://github.com/knoxergsdfhs/knox-cook.git)
echo.

set /p REPO_URL=Paste the GitHub repo URL:

if "%REPO_URL%"=="" (
    echo No URL given. Aborting.
    pause
    exit /b 1
)

git init
git branch -M main
git config user.email "ken.grover@acadianasystems.com"
git config user.name "Ken Grover"
git remote remove origin 2>nul
git remote add origin %REPO_URL%
git add -A
git commit -m "Cook v0.1 - public AI recipe library"
git push -u origin main

echo.
echo === DONE ===
echo Next: go to vercel.com, Add New Project, Import this repo, Deploy.
echo Paste the Vercel URL back to Claude.
echo From then on, double-click DEPLOY-COOK.bat to ship updates.
echo.
pause
endlocal
