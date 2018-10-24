#!/bin/bash
# Load anaconda 
#module load anaconda

##Create conda environment for snakemake 
#conda env create --name snakemake -f environment.yml
#source activate snakemake

# Or activate existing environment
#source activate snakemake-tara-euk # not working for some reason-- hard coded path below works. IDK why
#source /vortexfs1/apps/anaconda-5.1/bin/activate snakemake-tara-euk

# Or just have it here.
#source start-up

# Once your conda environment is activated: 
# Download Slurm profiles from github and install with cookie cutter

conda install cookiecutter

cookiecutter https://github.com/Snakemake-Profiles/slurm.git

cd slurm


# Modify slurm configuration file

echo -e 'rerun-incomplete: True
keep-going: True
latency-wait: 10
max-jobs-per-second: 1
restart-times: 2' >> config.yaml

## create bash script to run your project
echo -e '
snakemake   \
    --jobs 36           \
        --use-conda                         \
            --profile ./slurm' > submit-slurm.sh

echo -e '
snakemake -np                           \
        --use-conda                         \
            --profile ./slurm' > submit-slurm_dry.sh    

chmod u+x submit*sh

cd ../


