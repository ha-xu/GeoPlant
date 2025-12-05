# unzip the dataset from google drive
import os
import subprocess
from tqdm import tqdm
import config

def extract_with_progress(zip_path, extract_dir):
    # create dirs
    os.makedirs(extract_dir, exist_ok=True)

    # get total file count
    result = subprocess.run(["zipinfo", "-1", zip_path], capture_output=True, text=True)
    file_list = result.stdout.splitlines()
    total = len(file_list)

    print(f"Unzipping: {os.path.basename(zip_path)} ，total file number: {total}")

    # show the progresss bar
    with tqdm(total=total, desc="unzipping", unit="file") as pbar:
        process = subprocess.Popen(
            ["unzip", "-n", zip_path, "-d", extract_dir],
            stdout=subprocess.PIPE,
            stderr=subprocess.STDOUT,
            text=True
        )

        for line in process.stdout:
            if line.startswith("  inflating:") or line.startswith(" extracting:"):
                pbar.update(1)

        process.wait()

    print("unzip finished")


if __name__ == "__main__":

    satelitePatches_zip_path =  config.DATASET_DIR + "SatelitePatches.zip"
    bioclimatic_zip_path = config.DATASET_DIR + "SateliteTimeSeries-Bioclimatic.zip"
    landsat_zip_path = config.DATASET_DIR + "SateliteTimeSeries-Landsat.zip"
    satelitePatches_extract_dir = config.DATASET_DIR + "SatelitePatches"
    bioclimatic_extract_dir = config.DATASET_DIR + "SateliteTimeSeries-Bioclimatic"
    landsat_extract_dir = config.DATASET_DIR + "SateliteTimeSeries-Landsat"


    extract_with_progress(satelitePatches_zip_path, satelitePatches_extract_dir)
    extract_with_progress(bioclimatic_zip_path, bioclimatic_extract_dir)
    extract_with_progress(landsat_zip_path, landsat_extract_dir)

