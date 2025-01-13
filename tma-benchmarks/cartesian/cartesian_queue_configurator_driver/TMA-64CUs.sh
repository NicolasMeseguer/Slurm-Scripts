#!/bin/bash -l

##############################
#       Job blueprint        #
##############################

# Give your job a name, so you can recognize it in the queue overview
#SBATCH --job-name=tma_cartesian_queue_configurator_driver_64cus
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=8

# You may not place any commands before the last SBATCH directive

############################
#       Actual work        #
############################

cd /home/nmeseguer/mgpusim/samples/tma

# cartesian - Queue Configurator Driver
cd ./cartesian_queue_configurator_driver

go build

./cartesian_queue_configurator_driver -timing -report-all -magic-memory-copy -metric-file-name="slurm-64cus" -length_a=131072 -length_b=4096 -globalsize=36864 -localsize=576

# Finish the script
exit 0
