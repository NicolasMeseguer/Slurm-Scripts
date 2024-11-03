#!/bin/bash -l

##############################
#       Job blueprint        #
##############################

# Give your job a name, so you can recognize it in the queue overview
#SBATCH --job-name=tma_matrixvector_4cus
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
./matrixvector -timing -magic-memory-copy -report-all -metric-file-name="slurm-4cus-64" -dim_m=2048 -dim_k=2048 -TileSizeK=64 -globalsize=2304 -localsize=576 &

# 128 TileSize
./matrixvector -timing -magic-memory-copy -report-all -metric-file-name="slurm-4cus-128" -dim_m=2048 -dim_k=2048 -TileSizeK=128 -globalsize=2304 -localsize=576 &

# 256 TileSize
./matrixvector -timing -magic-memory-copy -report-all -metric-file-name="slurm-4cus-256" -dim_m=2048 -dim_k=2048 -TileSizeK=256 -globalsize=2304 -localsize=576 &

# 512 TileSize
./matrixvector -timing -magic-memory-copy -report-all -metric-file-name="slurm-4cus-512" -dim_m=2048 -dim_k=2048 -TileSizeK=512 -globalsize=2304 -localsize=576 &

wait

# Finish the script
exit 0
