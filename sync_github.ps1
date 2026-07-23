# 自动寻找 git.exe
$gitCandidates = @(
    "git",
    "C:\Program Files\Git\bin\git.exe",
    "C:\Program Files (x86)\Git\bin\git.exe",
    "$env:LOCALAPPDATA\Programs\Git\bin\git.exe"
)
$GIT = $null
foreach ($c in $gitCandidates) {
    $cmd = Get-Command $c -ErrorAction SilentlyContinue
    if ($cmd) { $GIT = $cmd.Source; break }
    if (Test-Path $c) { $GIT = $c; break }
}

if (-not $GIT) {
    Write-Host "[x] 找不到 git 命令。" -ForegroundColor Red
    Write-Host '    请安装 Git for Windows，安装时勾选 "Git from the command line and also from 3rd-party software"。'
    Write-Host "    下载地址：https://git-scm.com/download/win"
    Read-Host "按 Enter 键退出"
    exit 1
}

Write-Host "使用 Git: $GIT"

$repoRoot = Split-Path -Parent $MyInvocation.MyCommand.Path
Set-Location $repoRoot

Write-Host "[1/4] 正在添加文件..."
& $GIT add -A

Write-Host "[2/4] 正在提交..."
$dateStr = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
& $GIT commit -m "update archive $dateStr"

Write-Host "[3/4] 正在推送到 GitHub..."
& $GIT push -u origin HEAD

Write-Host ""
Write-Host "已推送完成。打开你的 GitHub Pages 网址即可看到最新归档："
Write-Host "https://bellali2336.github.io/xhs-archive/"
Read-Host "按 Enter 键退出"