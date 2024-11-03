#!/bin/bash -l

# No TMA ElementwiseK

cd ./elementwiseK_notma

sbatch NOTMA-1CU.sh
sbatch NOTMA-2CUs.sh
sbatch NOTMA-4CUs.sh
sbatch NOTMA-8CUs.sh
sbatch NOTMA-16CUs.sh
sbatch NOTMA-32CUs.sh
sbatch NOTMA-64CUs.sh

# Finish the script
exit 0
