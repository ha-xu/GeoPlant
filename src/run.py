import config
import os

def print_paths():
    print("Dataset Directory:", config.DATASET_DIR)
    print("Model Directory:", config.MODEL_DIR)
    # print the files in dataset directory (optional)
    print("Files in Dataset Directory:", os.listdir(config.DATASET_DIR))


if __name__ == "__main__":
    print_paths()