$ErrorActionPreference = "Stop"

$repoRoot = Split-Path -Parent $PSScriptRoot
$envPath = Join-Path $repoRoot ".conda-env"
$condaExe = "C:\Users\juha_\miniconda3\Scripts\conda.exe"

if (-not (Test-Path $condaExe)) {
    Write-Error "Conda executable not found at $condaExe"
}

if (-not (Test-Path $envPath)) {
    Write-Error "Project environment not found at $envPath"
}

$hook = & $condaExe shell.powershell hook | Out-String
Invoke-Expression $hook
conda activate $envPath

Write-Output "Activated: $env:CONDA_DEFAULT_ENV"
Write-Output "Python: $(python -c \"import sys; print(sys.executable)\")"
