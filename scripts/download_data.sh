#!/usr/bin/env bash
# ---------------------------------------------------------------
#  download_data.sh — Fetch NASA N‑CMAPSS DS02 raw data + SHA‑256
# ---------------------------------------------------------------
#  Download and extract nested ZIP from NASA PCoE to get N-CMAPSS_DS02-006.h5
set -euo pipefail

# Configuration
DATA_DIR="data/raw"
ZIP_URL="https://phm-datasets.s3.amazonaws.com/NASA/17.+Turbofan+Engine+Degradation+Simulation+Data+Set+2.zip"
ZIP_FILE="${DATA_DIR}/N-CMAPSS_DS02.zip"
TARGET_H5="${DATA_DIR}/N-CMAPSS_DS02-006.h5"
SHA_FILE="${DATA_DIR}/sha256.txt"

mkdir -p "$DATA_DIR"

# Download ZIP if HDF5 missing
if [[ ! -f "$TARGET_H5" ]]; then
  echo "[info] Downloading N-CMAPSS DS02 zip..."
  curl -L --fail --connect-timeout 30 --retry 3 "$ZIP_URL" -o "$ZIP_FILE"
  echo "[ok] Zip downloaded to $ZIP_FILE"

  # Extract nested data_set.zip to access HDF5
  echo "[info] Extracting nested data_set.zip from ZIP"
  unzip -j "$ZIP_FILE" "*/data_set.zip" -d "$DATA_DIR"

  echo "[info] Extracting DS02-006.h5 from data_set.zip"
  unzip -j "${DATA_DIR}/data_set.zip" "*DS02-006.h5" -d "$DATA_DIR"
  rm -f "${DATA_DIR}/data_set.zip"

  if [[ -f "$TARGET_H5" ]]; then
    echo "[ok] Extracted $TARGET_H5"
  else
    echo "[err] Extraction failed: $TARGET_H5 not found" >&2
    exit 1
  fi
else
  echo "[info] $TARGET_H5 already exists, skipping download."
fi

# Compute checksum
echo "[info] Computing SHA-256 checksum..."
sha256sum "$TARGET_H5" | tee -a "$SHA_FILE"

echo "[done]"