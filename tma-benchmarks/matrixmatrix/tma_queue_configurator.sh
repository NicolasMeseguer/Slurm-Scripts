#!/bin/bash -l

# TMA MatrixMatrix Queue Configurator

cd ./matrixmatrix_queue_configurator

# sbatch TMA-1CU.sh
# sbatch TMA-2CUs.sh
# sbatch TMA-4CUs.sh
# sbatch TMA-8CUs.sh

sbatch TMA-16CUs.sh
sbatch TMA-32CUs.sh
sbatch TMA-64CUs.sh

# Finish the script
exit 0
