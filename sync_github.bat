@echo off
cd /d %~dp0
echo [1/4] 正在添加文件...
git add -A
echo [2/4] 正在提交...
git commit -m "update archive %date% %time%"
echo [3/4] 正在推送到 GitHub...
git push -u origin HEAD
echo.
echo 已推送完成。打开你的 GitHub Pages 网址即可看到最新归档：
echo https://bellali2336.github.io/xhs-archive/
pause
