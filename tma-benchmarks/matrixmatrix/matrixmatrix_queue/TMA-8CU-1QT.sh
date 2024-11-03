#!/bin/bash -l

##############################
#       Job blueprint        #
##############################

# Give your job a name, so you can recognize it in the queue overview
#SBATCH --job-name=tma_matrixmatrix_queue_8cus_1qt

# Define, how many nodes you need. Here, we ask for 1 node since we have a single-node machine.
#SBATCH --nodes=1
# We want to launch 1 task.
#SBATCH --ntasks=1
# We want to use all the cores of the node.
#SBATCH --cpus-per-task=6

# You may not place any commands before the last SBATCH directive

############################
#       Actual work        #
############################

# MatrixMatrix
cd /home/nmeseguer/mgpusim/samples/tma

# Queue
cd ./matrixmatrix_queue

go build

# 64 TileSize
./matrixmatrix_queue -timing -magic-memory-copy -report-all -metric-file-name="slurm-8cus-1qt-64" -dim_m=128 -dim_k=512 -dim_n=128 -TileSizeK=64 -queue_tiles=1 -globalsize=4608 -localsize=576 &

# 128 TileSize
./matrixmatrix_queue -timing -magic-memory-copy -report-all -metric-file-name="slurm-8cus-1qt-128" -dim_m=128 -dim_k=512 -dim_n=128 -TileSizeK=128 -queue_tiles=1 -globalsize=4608 -localsize=576 &

# 256 TileSize
./matrixmatrix_queue -timing -magic-memory-copy -report-all -metric-file-name="slurm-8cus-1qt-256" -dim_m=128 -dim_k=512 -dim_n=128 -TileSizeK=256 -queue_tiles=1 -globalsize=4608 -localsize=576 &

# 512 TileSize
./matrixmatrix_queue -timing -magic-memory-copy -report-all -metric-file-name="slurm-8cus-1qt-512" -dim_m=128 -dim_k=512 -dim_n=128 -TileSizeK=512 -queue_tiles=1 -globalsize=4608 -localsize=576 &

wait

# Finish the script
exit 0
