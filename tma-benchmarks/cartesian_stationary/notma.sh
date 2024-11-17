#!/bin/bash -l

# No TMA Cartesian

cd ./cartesian_stationary_notma

sbatch NOTMA-1CU-512.sh
sbatch NOTMA-1CU-1024.sh
sbatch NOTMA-1CU-2048.sh
sbatch NOTMA-1CU-4096.sh

# Finish the script
exit 0
