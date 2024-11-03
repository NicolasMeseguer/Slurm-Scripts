#!/bin/bash -l

# TMA ElementwiseK Queue

cd ./elementwiseK_queue

sbatch TMA-1CU-1QT.sh
sbatch TMA-1CU-2QT.sh
sbatch TMA-1CU-4QT.sh
sbatch TMA-2CU-1QT.sh
sbatch TMA-2CU-2QT.sh
sbatch TMA-2CU-4QT.sh
sbatch TMA-4CU-1QT.sh
sbatch TMA-4CU-2QT.sh
sbatch TMA-4CU-4QT.sh
sbatch TMA-8CU-1QT.sh
sbatch TMA-8CU-2QT.sh
sbatch TMA-8CU-4QT.sh
sbatch TMA-16CU-1QT.sh
sbatch TMA-16CU-2QT.sh
sbatch TMA-32CU-1QT.sh
sbatch TMA-32CU-2QT.sh
sbatch TMA-64CU-1QT.sh
sbatch TMA-64CU-2QT.sh



# Finish the script
exit 0
