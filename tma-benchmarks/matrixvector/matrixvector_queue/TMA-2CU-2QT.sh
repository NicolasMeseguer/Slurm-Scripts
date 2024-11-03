#!/bin/bash -l

##############################
#       Job blueprint        #
##############################

# Give your job a name, so you can recognize it in the queue overview
#SBATCH --job-name=tma_matrixvector_queue_2cus_2qt

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

# MatrixVector
cd /home/nmeseguer/mgpusim/samples/tma

# Queue
cd ./matrixvector_queue

go build

# 64 TileSize
./matrixvector_queue -timing -magic-memory-copy -report-all -metric-file-name="slurm-2cus-2qt-64" -dim_m=2048 -dim_m=2048 -TileSizeK=64 -queue_tiles=2 -globalsize=1152 -localsize=576 &

# 128 TileSize
./matrixvector_queue -timing -magic-memory-copy -report-all -metric-file-name="slurm-2cus-2qt-128" -dim_m=2048 -dim_m=2048 -TileSizeK=128 -queue_tiles=2 -globalsize=1152 -localsize=576 &

# 256 TileSize
./matrixvector_queue -timing -magic-memory-copy -report-all -metric-file-name="slurm-2cus-2qt-256" -dim_m=2048 -dim_m=2048 -TileSizeK=256 -queue_tiles=2 -globalsize=1152 -localsize=576 &

# 512 TileSize
./matrixvector_queue -timing -magic-memory-copy -report-all -metric-file-name="slurm-2cus-2qt-512" -dim_m=2048 -dim_m=2048 -TileSizeK=512 -queue_tiles=2 -globalsize=1152 -localsize=576 &

wait

# Finish the script
exit 0
