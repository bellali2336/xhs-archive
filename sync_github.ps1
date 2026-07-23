# 设置工作目录为脚本所在目录
$repoRoot = Split-Path -Parent $MyInvocation.MyCommand.Path
Set-Location $repoRoot

Write-Host "[1/4] 正在添加文件..."
git add -A

Write-Host "[2/4] 正在提交..."
$dateStr = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
git commit -m "update archive $dateStr"

Write-Host "[3/4] 正在推送到 GitHub..."
git push -u origin HEAD

Write-Host ""
Write-Host "已推送完成。打开你的 GitHub Pages 网址即可看到最新归档："
Write-Host "https://bellali2336.github.io/xhs-archive/"
Read-Host "按 Enter 键退出"
