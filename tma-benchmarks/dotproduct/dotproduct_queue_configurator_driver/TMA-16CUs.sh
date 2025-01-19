#!/bin/bash -l

##############################
#       Job blueprint        #
##############################

# Give your job a name, so you can recognize it in the queue overview
#SBATCH --job-name=tma_dotproduct_queue_configurator_driver_16cus
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=2

# You may not place any commands before the last SBATCH directive

############################
#       Actual work        #
############################

cd /home/nmeseguer/mgpusim/samples/tma

# Dotproduct - Queue Configurator Driver
cd ./dotproduct_queue_configurator_driver

go build

./dotproduct_queue_configurator_driver -timing -report-all -magic-memory-copy -metric-file-name="slurm-16cus" -length=2097152 -globalsize=9216 -localsize=576 -gpu-model="$1"

# Create the $1 directory if it does not exist
mkdir -p $1

# Move the csv files to the $1 directory
mv slurm-* $1

# Finish the script
exit 0
