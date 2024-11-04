#!/bin/bash -l

# TMA dotproduct Queue

cd ./dotproduct_queue

sbatch TMA-1CU-1QT.sh
sbatch TMA-1CU-2QT.sh
sbatch TMA-1CU-4QT.sh
sbatch TMA-1CU-8QT.sh

# We can already skip 2CUs to 8CUs
# sbatch TMA-2CU-1QT.sh
# sbatch TMA-2CU-2QT.sh
# sbatch TMA-2CU-4QT.sh
# sbatch TMA-4CU-1QT.sh
# sbatch TMA-4CU-2QT.sh
# sbatch TMA-4CU-4QT.sh
# sbatch TMA-8CU-1QT.sh
# sbatch TMA-8CU-2QT.sh
# sbatch TMA-8CU-4QT.sh

# TODO: Wait for 1CU to finish, to get the best results
# sbatch TMA-16CU-1QT.sh
# sbatch TMA-16CU-2QT.sh
# sbatch TMA-32CU-1QT.sh
# sbatch TMA-32CU-2QT.sh
# sbatch TMA-64CU-1QT.sh
# sbatch TMA-64CU-2QT.sh

# Finish the script
exit 0
