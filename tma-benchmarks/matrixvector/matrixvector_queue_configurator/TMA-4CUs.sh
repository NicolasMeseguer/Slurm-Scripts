#!/bin/bash -l

##############################
#       Job blueprint        #
##############################

# Give your job a name, so you can recognize it in the queue overview
#SBATCH --job-name=tma_matrixvector_queue_configurator_4cus
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=4

# You may not place any commands before the last SBATCH directive

############################
#       Actual work        #
############################

cd /home/nmeseguer/mgpusim/samples/tma

# MatrixVector - Queue Configurator
cd ./matrixvector_queue_configurator

go build

./matrixvector_queue_configurator -timing -report-all -magic-memory-copy -metric-file-name="slurm-4cus" -dim_m=2048 -dim_k=2048 -globalsize=2304 -localsize=576

# Finish the script
exit 0
