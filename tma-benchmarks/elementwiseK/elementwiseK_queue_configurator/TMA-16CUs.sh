#!/bin/bash -l

##############################
#       Job blueprint        #
##############################

# Give your job a name, so you can recognize it in the queue overview
#SBATCH --job-name=tma_elementwiseK_queue_configurator_16cus
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=2

# You may not place any commands before the last SBATCH directive

############################
#       Actual work        #
############################

cd /home/nmeseguer/mgpusim/samples/tma

# Elementwise K - Queue
cd ./elementwiseK_queue_configurator

go build

./elementwiseK_queue_configurator -timing -report-all -magic-memory-copy -metric-file-name="slurm-16cus" -length=4194304 -globalsize=9216 -localsize=576

# Finish the script
exit 0
