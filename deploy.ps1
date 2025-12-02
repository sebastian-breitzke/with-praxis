#
# Praxis Deploy Script for Windows
# Deploys your Praxis to ~/.claude/
#
# Usage: .\deploy.ps1
#

$ErrorActionPreference = "Stop"

# Colors
$Blue = "`e[34m"
$Green = "`e[32m"
$Yellow = "`e[33m"
$NC = "`e[0m"

Write-Host "${Blue}Deploying Praxis...${NC}"
Write-Host ""

$ScriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$ClaudeDir = Join-Path $HOME ".claude"

# Create directories
New-Item -ItemType Directory -Force -Path $ClaudeDir | Out-Null
New-Item -ItemType Directory -Force -Path (Join-Path $ClaudeDir "commands") | Out-Null

# Deploy commands
$CommandsSource = Join-Path $ScriptDir "commands"
if (Test-Path $CommandsSource) {
    # Create command subdirectories
    $subDirs = @("px", "px\meeting", "doc", "doc\validate", "dev")
    foreach ($dir in $subDirs) {
        New-Item -ItemType Directory -Force -Path (Join-Path $ClaudeDir "commands\$dir") | Out-Null
    }

    # Copy all commands
    Copy-Item -Path "$CommandsSource\*" -Destination (Join-Path $ClaudeDir "commands") -Recurse -Force
    $cmdCount = (Get-ChildItem -Path (Join-Path $ClaudeDir "commands") -Filter "*.md" -Recurse).Count
    Write-Host "${Green}+${NC} Deployed $cmdCount commands"
}

# Deploy CLAUDE.md
$ClaudeMdSource = Join-Path $ScriptDir "system\CLAUDE.md"
$ClaudeMdDest = Join-Path $ClaudeDir "CLAUDE.md"
if (Test-Path $ClaudeMdSource) {
    Copy-Item -Path $ClaudeMdSource -Destination $ClaudeMdDest -Force
    Write-Host "${Green}+${NC} Deployed CLAUDE.md"
}

# Deploy telemetry tool if exists
$TelemetrySource = Join-Path $ScriptDir "tools\telemetry.ps1"
if (Test-Path $TelemetrySource) {
    $ToolsDir = Join-Path $ScriptDir "tools"
    New-Item -ItemType Directory -Force -Path $ToolsDir | Out-Null
    Copy-Item -Path $TelemetrySource -Destination (Join-Path $ToolsDir "telemetry.ps1") -Force
    Write-Host "${Green}+${NC} Deployed telemetry"
}

Write-Host ""
Write-Host "${Green}Done!${NC} Your Praxis is now active."
Write-Host ""
Write-Host "Start Claude in any project:"
Write-Host "  ${Blue}cd your-project; claude${NC}"
Write-Host ""
