import config

def print_paths():
    print("Dataset Directory:", config.DATASET_DIR)
    print("Model Directory:", config.MODEL_DIR)

if __name__ == "__main__":
    print_paths()