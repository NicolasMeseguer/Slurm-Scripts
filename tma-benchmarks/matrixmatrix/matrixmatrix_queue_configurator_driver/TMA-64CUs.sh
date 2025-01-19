#!/bin/bash -l

##############################
#       Job blueprint        #
##############################

# Give your job a name, so you can recognize it in the queue overview
#SBATCH --job-name=tma_matrixmatrix_queue_configurator_driver_64cus
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=8

# You may not place any commands before the last SBATCH directive

############################
#       Actual work        #
############################

# MatrixMatrix
cd /home/nmeseguer/mgpusim/samples/tma

# Queue Configurator
cd ./matrixmatrix_queue_configurator_driver

go build

./matrixmatrix_queue_configurator_driver -timing -magic-memory-copy -report-all -metric-file-name="slurm-64cus" -dim_m=512 -dim_k=2048 -dim_n=128 -globalsize=36864 -localsize=576 -gpu-model="$1"

# Create the $1 directory if it does not exist
mkdir -p $1

# Move the csv files to the $1 directory
mv slurm-1cu-* $1

# Finish the script
exit 0
