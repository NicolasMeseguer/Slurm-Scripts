#!/bin/bash -l

##############################
#       Job blueprint        #
##############################

# Give your job a name, so you can recognize it in the queue overview
#SBATCH --job-name=tma_elementwise_queue_configurator_4cus
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=2

# You may not place any commands before the last SBATCH directive

############################
#       Actual work        #
############################

cd /home/nmeseguer/mgpusim/samples/tma

# Elementwise K - Queue
cd ./elementwise_queue_configurator

go build

./elementwise_queue_configurator -timing -report-all -magic-memory-copy -metric-file-name="slurm-4cus" -length=1048576 -globalsize=2560 -localsize=640


# Finish the script
exit 0
