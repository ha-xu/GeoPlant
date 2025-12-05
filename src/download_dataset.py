import tarfile
import os
import config

archive_path = "/home/zx1875/.cache/kagglehub/datasets/picekl/geoplant/6.archive"
extract_path = "/home/zx1875/.cache/kagglehub/datasets/picekl/geoplant/versions/6"

os.makedirs(extract_path, exist_ok=True)

# Extract archive, skipping files that already exist
print(f"Extracting {archive_path}...")
with tarfile.open(archive_path, 'r:*') as tar:
    for member in tar.getmembers():
        target_path = os.path.join(extract_path, member.name)
        # Skip if file already exists
        if os.path.exists(target_path):
            print(f"Skipping (exists): {member.name}")
            continue
        tar.extract(member, path=extract_path)
        print(f"Extracted: {member.name}")

print(f"Done. Files in {extract_path}")

path = extract_path
print("Path to dataset files:", path)