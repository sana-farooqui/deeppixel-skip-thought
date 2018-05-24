#!/usr/bin/env bash

# Path to project
PROJECT_PATH="${HOME}/PycharmProjects/deeppixel-skip-thought"

# Directory containing the preprocessed data.
DATA_DIR="${PROJECT_PATH}/skip_thoughts/skip_thoughts/data"

# Directory to save the model.
MODEL_DIR="${PROJECT_PATH}/skip_thoughts/skip_thoughts/model"

# Build the model.
bazel build -c opt //skip_thoughts/...

# Run the training script.
bazel-bin/skip_thoughts/train \
  --input_file_pattern="${DATA_DIR}/train-?????-of-00100" \
  --train_dir="${MODEL_DIR}/train"

