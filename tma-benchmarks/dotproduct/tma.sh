#!/bin/bash -l

# TMA dotproduct

cd ./dotproduct

sbatch TMA-1CU.sh

# We can already skip 2CUs to 8CUs
# sbatch TMA-2CUs.sh
# sbatch TMA-4CUs.sh
# sbatch TMA-8CUs.sh

sbatch TMA-16CUs.sh
sbatch TMA-32CUs.sh
sbatch TMA-64CUs.sh

# Finish the script
exit 0
