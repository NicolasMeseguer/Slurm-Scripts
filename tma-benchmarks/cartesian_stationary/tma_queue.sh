#!/bin/bash -l

# TMA Cartesian Queue

cd ./cartesian_stationary_queue

# The first parameter is the name of the model
MODEL_NAME=$1

# If the name of the model is not 'r9nano' or 'mi100', then exit
if [ "$MODEL_NAME" != "r9nano" ] && [ "$MODEL_NAME" != "mi100" ] && [ "$MODEL_NAME" != "radeon530" ]; then

    echo "Invalid model name"
    exit 1
fi

sbatch TMA-1CU-512.sh $MODEL_NAME
sbatch TMA-1CU-1024.sh $MODEL_NAME
sbatch TMA-1CU-2048.sh $MODEL_NAME
sbatch TMA-1CU-4096.sh $MODEL_NAME


# Finish the script
exit 0
