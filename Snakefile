configfile: "config.yaml"  

import io 
import os
import pandas as pd
from snakemake.exceptions import print_exception, WorkflowError

SAMPLES = pd.read_table(config["input_ena_table"])
SAMPLES[['fastq_ftp1', 'fastq_ftp2']] = SAMPLES.fastq_ftp.str.split(';', expand =True)

#----SET VARIABLES----
STUDY = list(set(SAMPLES['study_accession'].tolist()))
assert(len(STUDY)==1), 'This ena table contains more than one study accession' 
assert(STUDY[0]==config["study_accession"]), 'The study accession provided in the config file does not match the study accession provided in the ena table.'

RUNS = SAMPLES['run_accession'].tolist()
FTP1 = SAMPLES['fastq_ftp1'].tolist()
FTP2 = SAMPLES['fastq_ftp2'].tolist()
TAIL1 = '_1.fastq.gz'
TAIL2 = '_2.fastq.gz'
OUTPUTDIR = config["outputDIR"]
DOWNLOAD_DICT = dict(zip(SAMPLES.run_accession, SAMPLES.fastq_ftp))


print(RUNS)
#FINAL_FILES1 = [os.path.join(OUTPUTDIR, STUDY,os.path.basename(SAMPLE[0]+TAIL1)) for SAMPLE in SAMPLES.iterrows()]

localrules: make_directories

rule make_directories:
    output: directory(expand("{outdir}/{study}/{run}/", outdir = OUTPUTDIR, study = STUDY, run=RUNS))

rule download_fastq1:
    output: expand("{outdir}/{study}/{run}/{run}_1.fastq.gz", outdir = OUTPUTDIR, study = STUDY, run=RUNS)

