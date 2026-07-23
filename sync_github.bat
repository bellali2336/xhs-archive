@echo off
chcp 936 >nul
cd /d %~dp0

set GIT_PATH=git
where git >nul 2>nul
if %errorlevel% neq 0 (
    if exist "C:\Program Files\Git\bin\git.exe" set GIT_PATH="C:\Program Files\Git\bin\git.exe"
    if exist "C:\Program Files (x86)\Git\bin\git.exe" set GIT_PATH="C:\Program Files (x86)\Git\bin\git.exe"
    if exist "%LOCALAPPDATA%\Programs\Git\bin\git.exe" set GIT_PATH="%LOCALAPPDATA%\Programs\Git\bin\git.exe"
)

%GIT_PATH% --version >nul 2>nul
if %errorlevel% neq 0 (
    echo [x] 找不到 git 命令。
    echo     请安装 Git for Windows，安装时勾选 "Git from the command line and also from 3rd-party software"。
    echo     下载地址：https://git-scm.com/download/win
    pause
    exit /b 1
)

echo [1/4] 正在添加文件...
%GIT_PATH% add -A
echo [2/4] 正在提交...
%GIT_PATH% commit -m "update archive %date% %time%"
echo [3/4] 正在推送到 GitHub...
%GIT_PATH% push -u origin HEAD
echo.
echo 已推送完成。打开你的 GitHub Pages 网址即可看到最新归档：
echo https://bellali2336.github.io/xhs-archive/
pause