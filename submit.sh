#!/bin/bash
#SBATCH --account=csci_ga_3033_szhang-2025fa
#SBATCH --partition=c12m85-a100-1
#SBATCH --gres=gpu:1
#SBATCH --time=08:00:00
#SBATCH --mem=32G  
#SBATCH --job-name=geoplant
#SBATCH --output=/scratch/zx1875/EoDL/logs/%x-%j.out
#SBATCH --error=/scratch/zx1875/EoDL/logs/%x-%j.err
#SBATCH --chdir=/home/zx1875/EoDL/GeoPlant

# THIS SCRIPT FILE SHOULD NEVER CHANGE

export MAIN_FOLDER=/home/zx1875/EoDL/GeoPlant/
# export DATA_FOLDER=/scratch/zx1875/EoDL/dataset
export LOG_FOLDER=/scratch/zx1875/EoDL/logs

# create log folder if it doesn't exist
mkdir -p $LOG_FOLDER

# Print job information
echo "Job starting on $(hostname)"
echo "Job ID: $SLURM_JOB_ID"

nvidia-smi

# Navigate to the main project directory
cd $MAIN_FOLDER
# Pull the latest code from the repository
git pull
# Run the script
bash scripts/run.sh
    
echo "job finished."