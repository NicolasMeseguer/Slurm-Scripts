#!/bin/bash -l

# TMA Queue YOLO

cd ./yolo_queue

# The first parameter is the name of the model
MODEL_NAME=$1

# If the name of the model is not 'r9nano' then exit
if [ "$MODEL_NAME" != "r9nano" ]; then

    echo "Invalid model name"
    exit 1
fi

sbatch runner.sh $MODEL_NAME

# Finish the script
exit 0
