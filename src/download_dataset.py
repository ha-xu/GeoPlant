# Install dependencies as needed:
# pip install kagglehub

import kagglehub

# Download latest version to specified directory
path = kagglehub.dataset_download("picekl/geoplant")

print("Path to dataset files:", path)