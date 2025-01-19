#!/bin/bash -l

##############################
#       Job blueprint        #
##############################

# Give your job a name, so you can recognize it in the queue overview
#SBATCH --job-name=tma_matrixvector_1cu
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=12

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
./matrixvector -timing -magic-memory-copy -report-all -metric-file-name="slurm-1cu-64" -dim_m=2048 -dim_k=2048 -TileSizeK=64 -globalsize=576 -localsize=576 -gpu-model="$1" &

# 128 TileSize
./matrixvector -timing -magic-memory-copy -report-all -metric-file-name="slurm-1cu-128" -dim_m=2048 -dim_k=2048 -TileSizeK=128 -globalsize=576 -localsize=576 -gpu-model="$1" &

# 256 TileSize
./matrixvector -timing -magic-memory-copy -report-all -metric-file-name="slurm-1cu-256" -dim_m=2048 -dim_k=2048 -TileSizeK=256 -globalsize=576 -localsize=576 -gpu-model="$1" &

# 512 TileSize
./matrixvector -timing -magic-memory-copy -report-all -metric-file-name="slurm-1cu-512" -dim_m=2048 -dim_k=2048 -TileSizeK=512 -globalsize=576 -localsize=576 -gpu-model="$1" &

wait

# Create the $1 directory if it does not exist
mkdir -p $1

# Move the csv files to the $1 directory
mv slurm-* $1

# Finish the script
exit 0
