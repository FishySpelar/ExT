Write-Host "Installing..." -ForegroundColor Cyan

$Repo = "FishySpelar/ExT"
$InstallDir = "$env:LOCALAPPDATA\ExT"

# Create installation directory
New-Item -ItemType Directory -Force -Path $InstallDir | Out-Null

# Download application
$DownloadUrl = "https://github.com/$Repo/releases/latest/download/ExT.exe"

Invoke-WebRequest -Uri $DownloadUrl -OutFile "ExT.exe"

Write-Host "Installation complete!" -ForegroundColor Green
