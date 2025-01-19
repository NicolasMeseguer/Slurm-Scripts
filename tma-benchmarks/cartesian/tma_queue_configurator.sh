#!/bin/bash -l

# TMA Cartesian Queue Configurator

cd ./cartesian_queue_configurator

# Sanity check, beacuse we are no longer supporting this model
echo "Invalid model name"
exit 1

sbatch TMA-1CU.sh
sbatch TMA-16CUs.sh
sbatch TMA-32CUs.sh
sbatch TMA-64CUs.sh

# Finish the script
exit 0
