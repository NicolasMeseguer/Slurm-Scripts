#!/bin/bash -l

##############################
#       Job blueprint        #
##############################

# Give your job a name, so you can recognize it in the queue overview
#SBATCH --job-name=tma_cartesian_queue_configurator_1cu_1qt
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=8

# You may not place any commands before the last SBATCH directive

############################
#       Actual work        #
############################

cd /home/nmeseguer/mgpusim/samples/tma

# cartesian - Queue Configurator
cd ./cartesian_queue_configurator

go build

./cartesian_queue_configurator -timing -report-all -magic-memory-copy -metric-file-name="slurm-1cu-1qt-512" -length_a=4096 -length_b=4096 -globalsize=576 -localsize=576

# Finish the script
exit 0
