# Earth and Environmental Data Science Book

[![Binder](https://img.shields.io/static/v1.svg?logo=Jupyter&label=Pangeo+Binder&message=GCP+us-central1&color=blue)](https://binder.pangeo.io/v2/gh/earth-env-data-science/earth-env-data-science-book/master)

This is the source repository for <https://earth-env-data-science.github.io>.

To deploy changes to the site, push to the master branch of this repo.

## Project-Local Conda Environment

This repository is configured for a project-local conda environment at `.conda-env/`.
This helps keep dependencies isolated from other projects.

### One-time setup

From the repository root:

```powershell
conda create -p .\.conda-env -c conda-forge --override-channels python=3.11 -y
conda install -p .\.conda-env -c conda-forge --override-channels jupyterlab notebook ipykernel numpy pandas xarray matplotlib scipy netcdf4 h5netcdf -y
conda run -p .\.conda-env python -m pip install -r requirements.txt
```

### Activate the project environment

PowerShell:

```powershell
.\scripts\activate.ps1
```

Bash (Git Bash / similar):

```bash
source scripts/activate.sh
```

### VS Code workspace behavior

Workspace settings are committed in `.vscode/settings.json` to prefer `.conda-env` as the default Python interpreter and enable terminal environment activation.
