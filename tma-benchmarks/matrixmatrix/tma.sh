#!/bin/bash -l

# TMA MatrixMatrix

cd ./matrixmatrix

sbatch TMA-1CU.sh
sbatch TMA-2CUs.sh
sbatch TMA-4CUs.sh
sbatch TMA-8CUs.sh

# Finish the script
exit 0
