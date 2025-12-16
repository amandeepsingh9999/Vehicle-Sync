Write-Host "🚀 Starting client update..." -ForegroundColor Cyan

# Move to script directory
Set-Location $PSScriptRoot

# Make sure it's a git repo
if (!(Test-Path ".git")) {
    Write-Host "❌ Not a git repository. Update aborted." -ForegroundColor Red
    exit 1
}

# Fetch latest changes
git fetch origin

# Check current branch
$branch = git rev-parse --abbrev-ref HEAD

# Pull updates
git pull origin $branch

if ($LASTEXITCODE -ne 0) {
    Write-Host "❌ Update failed. Manual intervention needed." -ForegroundColor Red
    exit 1
}

Write-Host "✅ Update completed successfully!" -ForegroundColor Green
Write-Host "Please restart the client to apply the updates." -ForegroundColor Yellow