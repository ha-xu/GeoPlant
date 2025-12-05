#!/bin/bash
#SBATCH --account=csci_ga_3033_szhang-2025fa
#SBATCH --partition=c12m85-a100-1
#SBATCH --gres=gpu:1
#SBATCH --time=08:00:00
#SBATCH --mem=32G  
#SBATCH --job-name=geoplant
#SBATCH --output=/scratch/zx1875/EoDL/logs/%x-%j.out
#SBATCH --error=/scratch/zx1875/EoDL/logs/%x-%j.err
#SBATCH --chdir=/home/zx1875/EoDL/search-and-learn 


export MAIN_FOLDER=/home/zx1875/EoDL
export DATA_FOLDER=/scratch/zx1875/EoDL/dataset
export LOG_FOLDER=/scratch/zx1875/EoDL/logs

# create log folder if it doesn't exist
mkdir -p $LOG_FOLDER

# 2. Print job information
echo "Job starting on $(hostname)"
echo "Job ID: $SLURM_JOB_ID"

nvidia-smi

echo "job finished."