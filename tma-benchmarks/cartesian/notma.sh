#!/bin/bash -l

# No TMA cartesian

cd ./cartesian_notma

sbatch NOTMA-1CU.sh
sbatch NOTMA-2CUs.sh
sbatch NOTMA-4CUs.sh

# Finish the script
exit 0
