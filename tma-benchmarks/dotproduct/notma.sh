#!/bin/bash -l

# No TMA dotproduct

cd ./dotproduct_notma

sbatch NOTMA-1CU.sh

# The DotProduct is not implemented spatially, using more means no improvement
# sbatch NOTMA-2CUs.sh
# sbatch NOTMA-4CUs.sh
# sbatch NOTMA-8CUs.sh
# sbatch NOTMA-16CUs.sh
# sbatch NOTMA-32CUs.sh
# sbatch NOTMA-64CUs.sh

# Finish the script
exit 0
