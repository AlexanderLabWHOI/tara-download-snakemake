
module load anaconda

##Create conda environment for snakemake 
#conda env create --name snakemake -f environment.yml
#source activate snakemake

#or activate existing environment
source activate snakemake-tara-euk

#install cookie cuter to facilitate download and setup of slurm scripts for submission via sbatch 
pip install cookiecutter 
work_dir=$(pwd) #set working directory to current directory-- should be whereever your Snakefile is 

# Download snakemake slurm config scripts from github Snakemake-Profiles
mkdir -p .config
cd .config
cookiecutter https://github.com/Snakemake-Profiles/slurm.git
































cd ../ && chmod u+x slurm/*
