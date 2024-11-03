#!/bin/bash -l

##############################
#       Job blueprint        #
##############################

# Give your job a name, so you can recognize it in the queue overview
#SBATCH --job-name=tma_matrixmatrix_queue_configurator_8cus
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
cd ./matrixmatrix_queue_configurator

go build

./matrixmatrix_queue_configurator -timing -magic-memory-copy -report-all -metric-file-name="slurm-8cus" -dim_m=2048 -dim_k=2048 -dim_n=2048 -globalsize=4608 -localsize=576

# Finish the script
exit 0
