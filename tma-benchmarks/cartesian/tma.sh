#!/bin/bash -l

# TMA cartesian

cd ./cartesian

sbatch TMA-1CU.sh
sbatch TMA-2CUs.sh
sbatch TMA-4CUs.sh

# Finish the script
exit 0
