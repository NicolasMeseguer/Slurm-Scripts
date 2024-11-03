#!/bin/bash -l

##############################
#       Job blueprint        #
##############################

# Give your job a name, so you can recognize it in the queue overview
#SBATCH --job-name=tma_matrixvector_1cu

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

# TMA
cd ./matrixvector

go build

# 64 TileSize 
./matrixvector -timing -magic-memory-copy -report-all -metric-file-name="slurm-1cu-64" -dim_m=2048 -dim_k=2048 -TileSizeK=64 -globalsize=576 -localsize=576

# 128 TileSize
./matrixvector -timing -magic-memory-copy -report-all -metric-file-name="slurm-1cu-128" -dim_m=2048 -dim_k=2048 -TileSizeK=128 -globalsize=576 -localsize=576

# 256 TileSize
./matrixvector -timing -magic-memory-copy -report-all -metric-file-name="slurm-1cu-256" -dim_m=2048 -dim_k=2048 -TileSizeK=256 -globalsize=576 -localsize=576

# 512 TileSize
./matrixvector -timing -magic-memory-copy -report-all -metric-file-name="slurm-1cu-512" -dim_m=2048 -dim_k=2048 -TileSizeK=512 -globalsize=576 -localsize=576

# Finish the script
exit 0
