#!/bin/bash -l

# No TMA Sumvectors

cd ./sumvectors_notma

sbatch NOTMA-1CU.sh
sbatch NOTMA-16CUs.sh
sbatch NOTMA-32CUs.sh
sbatch NOTMA-64CUs.sh

# Finish the script
exit 0
