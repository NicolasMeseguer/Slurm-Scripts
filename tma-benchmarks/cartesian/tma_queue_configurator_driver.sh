#!/bin/bash -l

# TMA Cartesian Queue Configurator Driver

cd ./cartesian_queue_configurator_driver

# The first parameter is the name of the model
MODEL_NAME=$1

# If the name of the model is not 'r9nano' or 'mi100', then exit
if [ "$MODEL_NAME" != "r9nano" ] && [ "$MODEL_NAME" != "mi100" ]; then
    echo "Invalid model name"
    exit 1
fi

sbatch TMA-1CU.sh $MODEL_NAME
sbatch TMA-16CUs.sh $MODEL_NAME
sbatch TMA-32CUs.sh $MODEL_NAME
sbatch TMA-64CUs.sh $MODEL_NAME

# Finish the script
exit 0
