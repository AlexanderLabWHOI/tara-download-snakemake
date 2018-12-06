
snakemake -np                           \
        --use-conda                         \
            --profile general-slurm-profile		\
 		--cluster "sbatch --parsable --partition=compute --job-name=TARA.{rule}.{wildcards} --mem=1gb --time=24:00:00 --ntasks=1 --nodes=1"	
