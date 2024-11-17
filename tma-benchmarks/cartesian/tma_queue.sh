#!/bin/bash -l

# TMA Cartesian Queue

cd ./cartesian_queue

sbatch TMA-1CU-1QT.sh
sbatch TMA-1CU-2QT.sh
# sbatch TMA-2CU-1QT.sh
# sbatch TMA-2CU-2QT.sh
# sbatch TMA-4CU-1QT.sh
# sbatch TMA-4CU-2QT.sh
# sbatch TMA-8CU-1QT.sh
# sbatch TMA-8CU-2QT.sh
sbatch TMA-16CU-1QT.sh
sbatch TMA-32CU-1QT.sh
sbatch TMA-64CU-1QT.sh


# Finish the script
exit 0
