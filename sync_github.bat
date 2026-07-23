@echo off
cd /d %~dp0
git add -A
git commit -m "update archive %date% %time%" >nul 2>&1
git push -u origin HEAD
echo.
echo 已推送。打开你的 GitHub Pages 网址即可看到最新归档：
echo https://bellali2336.github.io/xhs-archive/
pause
