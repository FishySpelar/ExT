
$Host.UI.RawUI.WindowTitle = "ExT Setup"

$InstallDir = "$env:LOCALAPPDATA\ExT"
$DownloadUrl = "https://raw.githubusercontent.com/FishySpelar/ExT/e588b76800a2ca7c21d12173329389d150261c31/ExT.exe"
$OutputFile = Join-Path $InstallDir "ExT.exe"

Clear-Host

Write-Host "====================================" -ForegroundColor Cyan
Write-Host "             ExT SETUP" -ForegroundColor Cyan
Write-Host "====================================" -ForegroundColor Cyan

Write-Host ""
Write-Host "WARNING: PRIVACY NOTICE" -ForegroundColor Red
Write-Host "ExT collects system information and transmits it"
Write-Host "to an external Discord webhook."
Write-Host ""
Write-Host "Collected information may include:" -ForegroundColor Yellow
Write-Host "- Computer name and username"
Write-Host "- Operating system and hardware"
Write-Host "- Public IP address"
Write-Host "- Directory and runtime information"
Write-Host ""
Write-Host "Do not install this on a device you do not own"
Write-Host "or have explicit authorization to test."
Write-Host ""

$Confirm = Read-Host "Do you understand and wish to download ExT? (YES/NO)"

if ($Confirm -cne "YES") {
    Write-Host "`nDownload cancelled." -ForegroundColor Red
    exit
}

try {
    Write-Host "`nPreparing installation directory..." -ForegroundColor Cyan

    New-Item -ItemType Directory -Force -Path $InstallDir | Out-Null

    Write-Host "Downloading ExT..." -ForegroundColor Cyan

    Invoke-WebRequest `
        -Uri $DownloadUrl `
        -OutFile $OutputFile `
        -ErrorAction Stop

    Write-Host "`nDownload complete!" -ForegroundColor Green
    Write-Host "Location: $OutputFile" -ForegroundColor Gray
    Write-Host "The application has NOT been executed." -ForegroundColor Yellow
}
catch {
    Write-Host "`nDownload failed: $($_.Exception.Message)" -ForegroundColor Red
}
