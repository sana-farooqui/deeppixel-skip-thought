#!/usr/bin/env bash

# Path to project
PROJECT_PATH="${HOME}/PycharmProjects/deeppixel-skip-thought"

# Comma-separated list of globs matching the input input files. The format of
# the input files is assumed to be a list of newline-separated sentences, where
# each sentence is already tokenized.
INPUT_FILES="${PROJECT_PATH}/wikicorpus/*.txt"

# Location to save the preprocessed training and validation data.
DATA_DIR="${PROJECT_PATH}/skip_thoughts/skip_thoughts/data"

# Build the preprocessing script.
bazel build -c opt //skip_thoughts/data:preprocess_dataset

# Run the preprocessing script.
bazel-bin/skip_thoughts/data/preprocess_dataset \
  --input_files=${INPUT_FILES} \
  --output_dir=${DATA_DIR}