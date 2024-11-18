#!/bin/bash -l

##############################
#       Job blueprint        #
##############################

# Give your job a name, so you can recognize it in the queue overview
#SBATCH --job-name=tma_sumvectors_queue_configurator_32cus
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=2

# You may not place any commands before the last SBATCH directive

############################
#       Actual work        #
############################

cd /home/nmeseguer/mgpusim/samples/tma

# sumvectors K - Queue
cd ./sumvectors_queue_configurator

go build

./sumvectors_queue_configurator -timing -report-all -magic-memory-copy -metric-file-name="slurm-32cus" -length=8388608 -globalsize=20480 -localsize=640


# Finish the script
exit 0
