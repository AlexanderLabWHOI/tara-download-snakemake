configfile: "config.yaml"  

import io 
import os
import pandas as pd


SAMPLES = pd.read_table('input/test.txt')
SAMPLES[['fastq_ftp1', 'fastq_ftp2']] = SAMPLES.fastq_ftp.str.split(';', expand =True)

STUDY = SAMPLES['study_accession'].tolist()
RUNS = SAMPLES['run_accession'].tolist()
FTP1 = SAMPLES['fastq_ftp1'].tolist()
FTP2 = SAMPLES['fastq_ftp2'].tolist()
TAIL1 = '_1.fastq.gz'
TAIL2 = '_2.fastq.gz'
OUTPUTDIR = config["outputDIR"]

print(STUDY)
#FINAL_FILES1 = [os.path.join(OUTPUTDIR, STUDY,os.path.basename(SAMPLE[0]+TAIL1)) for SAMPLE in SAMPLES.iterrows()]

localrules: fastq1, fastq2

rule fastq1:
    input: expand("{outdir}/{study}/{run}/{run}{tail}", outdir = OUTPUTDIR, study = STUDY, run=RUNS, tail=TAIL1)

rule fastq2: 
    input: expand("{outdir}/{study}/{run}/{run}{tail}", outdir = OUTPUTDIR, study = STUDY, run=RUNS, tail=TAIL2)

rule get_sra_by_run:
    output:
    params: sge_opts="-l mfree=4G -l h_rt=1:0:0", run_prefix=lambda wildcards: wildcards.run[:6], sra_prefix=lambda wildcards: wildcards.run[:3]
shell: "ascp -i $MOD_GSASPERA_DIR/connect/etc/asperaweb_id_dsa.putty -L . -l 1 -QTr -l 300m anonftp@ftp-trace.ncbi.nlm.nih.gov:/sra/sra-instant/reads/ByRun/sra/{params.sra_prefix}/{params.run_prefix}/{wildcards.run}/{wildcards.run}.sra `dirname {output}`"
    

# === DOWNLOAD ===

rule download_reference: 
#     output: os.path.join(OUTPUTDIR, STUDY, {SAMPLE}+TAIL1)
#     run:
#          print('os.path.join(OUTHPUTDIR, STUDY, {SAMPLE}+TAIL1)')
#          URL1 = SAMPLES.loc[wildcards.SAMPLE]['fastq_ftp1']
#      	  shell('curl -s {URL1} -o {output}')
