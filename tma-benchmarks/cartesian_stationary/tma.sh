#!/bin/bash -l

# TMA Cartesian

cd ./cartesian_stationary

sbatch TMA-1CU-512.sh
sbatch TMA-1CU-1024.sh
sbatch TMA-1CU-2048.sh
sbatch TMA-1CU-4096.sh

# Finish the script
exit 0
