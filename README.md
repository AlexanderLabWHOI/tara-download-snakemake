# Snakemake Workflow for Streamlining and Checking Downloads from the ENA/EBI

## Pre-requisites

To run this tutorial you will need anaconda or miniconda installed.
```
module load anaconda # Example to use on HPC
```

Create a conda environment using the `environment.yml` file: 
```
conda env create --name snakemake --file environment.yaml  
source activate snakemake
```

Once within the `snakemake` environment, execute the `snakemake_setup.py` script. 

```
. snakemake_setup.py
```

This will run the download of cookiecutter as well as pull the slurm profile from https://github.com/Snakemake-Profiles/slurm. You will be prompted to provide default values-- you may leave these blank (recommended) or supply values. 

This only needs to be run once per download of the workflow. 


Execute a dry run in snakemake and check the total number of jobs required to run.
```
snakemake -np
```

Once dry run is successful and the configuration of your snakemake workflow is set up, run snakemake workflow.

```
snakemake --use-conda
```

