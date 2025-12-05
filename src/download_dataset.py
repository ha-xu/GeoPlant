# Install dependencies as needed:
# pip install kagglehub
import config

# Set the path to the file you'd like to load
file_path = config.DATASET_DIR

import kagglehub
import os

# Download latest version to specified directory
os.makedirs(file_path, exist_ok=True)
path = kagglehub.dataset_download("picekl/geoplant", path=file_path)

print("Path to dataset files:", path)