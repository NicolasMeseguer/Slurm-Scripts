#!/bin/bash -l

# TMA dotproduct

cd ./dotproduct

sbatch TMA-1CU.sh

# The DotProduct is not implemented spatially, using more means no improvement
# sbatch TMA-2CUs.sh
# sbatch TMA-4CUs.sh
# sbatch TMA-8CUs.sh
# sbatch TMA-16CUs.sh
# sbatch TMA-32CUs.sh
# sbatch TMA-64CUs.sh

# Finish the script
exit 0
