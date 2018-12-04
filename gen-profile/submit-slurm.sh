
snakemake   \
    --jobs 200           \
        --use-conda                         \
            --profile gen-slurm-2		\
		--cluster "sbatch --partition=compute --job-name=TARA.{rule}.{wildcards} --mem=1gb --time=24:00:00 --ntasks=1 --nodes=1"

