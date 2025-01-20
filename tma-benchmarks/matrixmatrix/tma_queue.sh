#!/bin/bash -l

# TMA Queue MatrixMatrix

cd ./matrixmatrix_queue

# The first parameter is the name of the model
MODEL_NAME=$1

# If the name of the model is not 'r9nano' or 'mi100', then exit
if [ "$MODEL_NAME" != "r9nano" ] && [ "$MODEL_NAME" != "mi100" ] && [ "$MODEL_NAME" != "radeon530" ]; then

    echo "Invalid model name"
    exit 1
fi

sbatch runner.sh $MODEL_NAME

# Finish the script
exit 0
