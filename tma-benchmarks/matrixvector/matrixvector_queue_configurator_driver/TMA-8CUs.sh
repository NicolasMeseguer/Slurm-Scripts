#!/bin/bash -l

##############################
#       Job blueprint        #
##############################

# Give your job a name, so you can recognize it in the queue overview
#SBATCH --job-name=tma_matrixvector_queue_configurator_driver_8cus
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=4

# You may not place any commands before the last SBATCH directive

############################
#       Actual work        #
############################

cd /home/nmeseguer/mgpusim/samples/tma

# MatrixVector - Queue Configurator Driver
cd ./matrixvector_queue_configurator_driver

go build

./matrixvector_queue_configurator_driver -timing -report-all -magic-memory-copy -metric-file-name="slurm-8cus" -dim_m=2048 -dim_k=2048 -globalsize=4608 -localsize=576 -gpu-model="$1"

# Create the $1 directory if it does not exist
mkdir -p $1

# Move the csv files to the $1 directory
mv slurm-1cu-* $1

# Finish the script
exit 0
