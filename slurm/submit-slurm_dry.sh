
snakemake -np                           \
        --use-conda                         \
            --profile ./slurm \
	--cluster-config ./slurm/cluster.yaml
