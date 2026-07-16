#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
ENV_PATH="$REPO_ROOT/.conda-env"
CONDA_EXE="/c/Users/juha_/miniconda3/Scripts/conda.exe"

if [[ ! -x "$CONDA_EXE" ]]; then
  echo "Conda executable not found at $CONDA_EXE" >&2
  return 1 2>/dev/null || exit 1
fi

if [[ ! -d "$ENV_PATH" ]]; then
  echo "Project environment not found at $ENV_PATH" >&2
  return 1 2>/dev/null || exit 1
fi

if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
  echo "Run this script with: source scripts/activate.sh" >&2
  exit 1
fi

__conda_setup="$($CONDA_EXE shell.bash hook 2>/dev/null)"
eval "$__conda_setup"
unset __conda_setup

conda activate "$ENV_PATH"

echo "Activated: ${CONDA_DEFAULT_ENV:-unknown}"
echo "Python: $(python -c 'import sys; print(sys.executable)')"
