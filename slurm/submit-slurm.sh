
snakemake   \
    --jobs 50           \
        --use-conda                         \
            --profile ./slurm 			\
		--cluster "sbatch --partition=compute --job-name=TARA.{rule}.{wildcards} --mem=1gb --time=24:00:00 --ntasks=1 --nodes=1"

