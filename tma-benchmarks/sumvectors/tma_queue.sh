#!/bin/bash -l

# TMA Sumvectors Queue

cd ./sumvectors_queue

sbatch TMA-1CU-1QT.sh
sbatch TMA-1CU-2QT.sh
sbatch TMA-1CU-4QT.sh
sbatch TMA-16CU-1QT.sh
sbatch TMA-16CU-4QT.sh
sbatch TMA-32CU-1QT.sh
sbatch TMA-32CU-4QT.sh
sbatch TMA-64CU-1QT.sh
sbatch TMA-64CU-4QT.sh


# Finish the script
exit 0
