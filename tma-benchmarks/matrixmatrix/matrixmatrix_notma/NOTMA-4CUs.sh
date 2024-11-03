#!/bin/bash -l

##############################
#       Job blueprint        #
##############################

# Give your job a name, so you can recognize it in the queue overview
#SBATCH --job-name=tma_matrixmatrix_notma_4cus

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

# MatrixMatrix - No TMA
cd ./matrixmatrix_notma

go build

# 64 TileSize
./matrixmatrix_notma -timing -report-all -metric-file-name="slurm-4cus-64" -dim_m=128 -dim_k=512 -dim_n=128 -TileSizeK=64 -globalsize=2048 -localsize=512 &

# 128 TileSize
./matrixmatrix_notma -timing -report-all -metric-file-name="slurm-4cus-128" -dim_m=128 -dim_k=512 -dim_n=128 -TileSizeK=128 -globalsize=2048 -localsize=512 &

# 256 TileSize
./matrixmatrix_notma -timing -report-all -metric-file-name="slurm-4cus-256" -dim_m=128 -dim_k=512 -dim_n=128 -TileSizeK=256 -globalsize=2048 -localsize=512 &

# 512 TileSize
./matrixmatrix_notma -timing -report-all -metric-file-name="slurm-4cus-512" -dim_m=128 -dim_k=512 -dim_n=128 -TileSizeK=512 -globalsize=2048 -localsize=512 &

wait

# Finish the script
exit 0
