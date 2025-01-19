#!/bin/bash -l

# No TMA Sumvectors

cd ./sumvectors_notma

# The first parameter is the name of the model
MODEL_NAME=$1

# If the name of the model is not 'r9nano' or 'mi100', then exit
if [ "$MODEL_NAME" != "r9nano" ] && [ "$MODEL_NAME" != "mi100" ]; then
    echo "Invalid model name"
    exit 1
fi

sbatch NOTMA-1CU.sh $MODEL_NAME
sbatch NOTMA-16CUs.sh $MODEL_NAME
sbatch NOTMA-32CUs.sh $MODEL_NAME
sbatch NOTMA-64CUs.sh $MODEL_NAME

# Finish the script
exit 0
