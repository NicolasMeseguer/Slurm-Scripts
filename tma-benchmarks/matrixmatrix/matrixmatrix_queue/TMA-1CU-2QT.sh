#!/bin/bash -l

##############################
#       Job blueprint        #
##############################

# Give your job a name, so you can recognize it in the queue overview
#SBATCH --job-name=tma_matrixmatrix_queue_1cu_2qt
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=12

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
./matrixmatrix_queue -timing -magic-memory-copy -report-all -metric-file-name="slurm-1cu-2qt-64" -dim_m=512 -dim_k=2048 -dim_n=128 -TileSizeK=64 -queue_tiles=2 -globalsize=576 -localsize=576 -gpu-model="$1" &

# 128 TileSize
./matrixmatrix_queue -timing -magic-memory-copy -report-all -metric-file-name="slurm-1cu-2qt-128" -dim_m=512 -dim_k=2048 -dim_n=128 -TileSizeK=128 -queue_tiles=2 -globalsize=576 -localsize=576 -gpu-model="$1" &

# 256 TileSize
./matrixmatrix_queue -timing -magic-memory-copy -report-all -metric-file-name="slurm-1cu-2qt-256" -dim_m=512 -dim_k=2048 -dim_n=128 -TileSizeK=256 -queue_tiles=2 -globalsize=576 -localsize=576 -gpu-model="$1" &

# 512 TileSize
./matrixmatrix_queue -timing -magic-memory-copy -report-all -metric-file-name="slurm-1cu-2qt-512" -dim_m=512 -dim_k=2048 -dim_n=128 -TileSizeK=512 -queue_tiles=2 -globalsize=576 -localsize=576 -gpu-model="$1" &

wait

# Create the $1 directory if it does not exist
mkdir -p $1

# Move the csv files to the $1 directory
mv slurm-1cu-* $1

# Finish the script
exit 0
