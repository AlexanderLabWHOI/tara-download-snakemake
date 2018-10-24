# Snakemake Workflow for Streamlining and Checking Downloads from the ENA/EBI

## Pre-requesits
To run this tutorial you will need anaconda or miniconda installed. If running on WHOI Poseidon: 
```
module load anaconda 
```

Create a conda environment using the `environment.yml` file: 
```
conda env create --name snakemake -f environment.yml  
source activate snakemake
```

Once within the `snakemake` environment, execute the snakemake
