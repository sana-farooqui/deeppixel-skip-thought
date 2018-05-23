#!/usr/bin/env bash

# Script modified from https://github.com/tensorflow/models/tree/master/research/skip_thoughts/README.md
# USAGE:
usage() {
	echo "./eval.sh [MODEL-TYPE] [TASK]"
	echo "MODEL-TYPE must be one of \"uni\" or \"bi\""
	echo "TASK must be one of \"SKIP\" or \"MSRP\""
	}

MODELTYPE=$1
TASK=$2

if [[  $# -ne 2 || (${MODELTYPE} != uni && ${MODELTYPE} != "bi") || (${TASK} != "SKIP" && ${TASK} != "MSRP")  ]];
	then
		usage
		exit 1
fi

# Path to project
PROJECT_PATH="${HOME}/PycharmProjects/deeppixel-skip-thought/skip_thoughts"

# Path to pretrained embedings
PRETRAINED_PATH="${PROJECT_PATH}/pretrained/skip_thoughts_bi_2017_02_16"

# Path to checkpoint file or a directory containing checkpoint files (the script
# will select the most recent).
CHECKPOINT_PATH="${PRETRAINED_PATH}/model.ckpt-500008"

# Vocabulary file generated by the vocabulary expansion script.
VOCAB_FILE="${PRETRAINED_PATH}/vocab.txt"

# Embeddings file generated by the vocabulary expansion script.
EMBEDDINGS_FILE="${PRETRAINED_PATH}/embeddings.npy"

# Directory containing evaluation datasets.
EVAL_DATA_DIR="${PROJECT_PATH}/eval_data"

# Build the evaluation script.
#cd skip_thoughts
bazel build -c opt //skip_thoughts:evaluate

# Run the evaluation script.
bazel-bin/skip_thoughts/evaluate \
  --eval_task=${TASK} \
  --data_dir=${EVAL_DATA_DIR} \
  --${MODELTYPE}_vocab_file=${VOCAB_FILE} \
  --${MODELTYPE}_embeddings_file=${EMBEDDINGS_FILE} \
  --${MODELTYPE}_checkpoint_path=${CHECKPOINT_PATH}
