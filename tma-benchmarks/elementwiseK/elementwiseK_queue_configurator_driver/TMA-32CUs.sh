#!/bin/bash -l

##############################
#       Job blueprint        #
##############################

# Give your job a name, so you can recognize it in the queue overview
#SBATCH --job-name=tma_elementwiseK_queue_configurator_driver_32cus
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=2

# You may not place any commands before the last SBATCH directive

############################
#       Actual work        #
############################

cd /home/nmeseguer/mgpusim/samples/tma

# Elementwise K - Queue Configurator Driver
cd ./elementwiseK_queue_configurator_driver

go build

./elementwiseK_queue_configurator_driver -timing -report-all -magic-memory-copy -metric-file-name="slurm-32cus" -length=8388608 -globalsize=18432 -localsize=576

# Finish the script
exit 0
