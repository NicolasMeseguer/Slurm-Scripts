#!/bin/bash -l

##############################
#       Job blueprint        #
##############################

# Give your job a name, so you can recognize it in the queue overview
#SBATCH --job-name=tma_matrixvector_queue_16cus_2qt
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=12

# You may not place any commands before the last SBATCH directive

############################
#       Actual work        #
############################

# MatrixVector
cd /home/nmeseguer/mgpusim/samples/tma

# Queue
cd ./matrixvector_queue

go build

# 512 TileSize
./matrixvector_queue -timing -magic-memory-copy -report-all -metric-file-name="slurm-16cus-2qt-512" -dim_m=2048 -dim_m=2048 -TileSizeK=512 -queue_tiles=2 -globalsize=9216 -localsize=576 &

wait

# Finish the script
exit 0