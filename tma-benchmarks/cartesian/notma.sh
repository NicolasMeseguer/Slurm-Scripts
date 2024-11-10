#!/bin/bash -l

# No TMA Cartesian

cd ./cartesian_notma

sbatch NOTMA-1CU.sh
sbatch NOTMA-2CUs.sh
sbatch NOTMA-4CUs.sh
sbatch NOTMA-8CUs.sh

# Finish the script
exit 0
