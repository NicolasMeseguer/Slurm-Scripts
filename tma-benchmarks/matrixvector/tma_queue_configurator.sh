#!/bin/bash -l

# TMA MatrixVector Queue Configurator

cd ./matrixvector_queue_configurator

sbatch TMA-1CU.sh
sbatch TMA-2CUs.sh
sbatch TMA-4CUs.sh
sbatch TMA-8CUs.sh

# Finish the script
exit 0
