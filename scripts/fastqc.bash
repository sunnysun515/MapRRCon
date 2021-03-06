#!/bin/bash

#SBATCH --job-name=FASTQC
##SBATCH --nodes=1
##SBATCH --cpus-per-task=1
#SBATCH --mem=100GB
##SBATCH --gres=gpu:1
##SBATCH --partition=gpu4_medium
#SBATCH --partition=cpu_long
##SBATCH --error=/gpfs/data/proteomics/projects/Sunny/gitrepo/MapRRCon/err_out/%x_%j.err
##SBATCH --output=/gpfs/data/proteomics/projects/Sunny/gitrepo/MapRRCon/err_out/%x_%j.out
##SBATCH --dependency=afterany:job_id

echo 'test'

####### modules ##########
module load fastqc/0.11.7

# change directory into the target folder
#cd $1

#fastqc ./ JL01_S1_R1_001.fastq.gz
