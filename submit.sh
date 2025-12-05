#!/bin/bash
#SBATCH --account=csci_ga_3033_szhang-2025fa
#SBATCH --partition=c12m85-a100-1
#SBATCH --gres=gpu:1
#SBATCH --time=08:00:00
#SBATCH --mem=64G  
#SBATCH --job-name=geoplant_unzip
#SBATCH --output=/scratch/zx1875/EoDL/logs/%x-%j.out
#SBATCH --error=/scratch/zx1875/EoDL/logs/%x-%j.err
#SBATCH --chdir=/home/zx1875

# THIS SCRIPT FILE SHOULD NEVER CHANGE



# Set variables
export REPO_URL=https://github.com/ha-xu/GeoPlant.git
export MAIN_FOLDER=/home/zx1875/EoDL/GeoPlant/
export DATA_FOLDER=/scratch/zx1875/EoDL/dataset
export LOG_FOLDER=/scratch/zx1875/EoDL/logs

# create log folder if it doesn't exist
mkdir -p $LOG_FOLDER

# Print job information
echo "Job starting on $(hostname)"
echo "Job ID: $SLURM_JOB_ID"
nvidia-smi

###

# Clone the repository if it doesn't exist
if [ ! -d $MAIN_FOLDER ]; then
    echo "$MAIN_FOLDER does not exist."
    cd /home/zx1875/
    mkdir EoDL
    cd EoDL
    git clone $REPO_URL
fi

cd $DATA_FOLDER
rm -rf SatelitePatches
rm -rf SateliteTimeSeries-Bioclimatic
rm -rf SateliteTimeSeries-Landsat

mkdir SatelitePatches
mkdir SateliteTimeSeries-Bioclimatic
mkdir SateliteTimeSeries-Landsat


# Navigate to the main project directory
cd $MAIN_FOLDER
# Pull the latest code from the repository
git pull
# Run the script
# bash scripts/run.sh
python src/unzip.py
    
echo "job finished."