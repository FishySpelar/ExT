Write-Host "Installing..." -ForegroundColor Cyan

$InstallDir = "$env:LOCALAPPDATA\ExT"

# Create installation directory
New-Item -ItemType Directory -Force -Path $InstallDir | Out-Null

# Download application
$DownloadUrl = "https://github.com/FishySpelar/ExT/blob/5cf639711c0c64240d4087b6edb63b9af5bc30d4/ExT.exe"

Invoke-WebRequest -Uri $DownloadUrl -OutFile "ExT.exe"

Write-Host "Installation complete!" -ForegroundColor Green
