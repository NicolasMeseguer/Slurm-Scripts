#!/bin/bash -l

##############################
#       Job blueprint        #
##############################

# Give your job a name, so you can recognize it in the queue overview
#SBATCH --job-name=tma_matrixvector_queue_2cus_1qt
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

# 64 TileSize
./matrixvector_queue -timing -magic-memory-copy -report-all -metric-file-name="slurm-2cus-1qt-64" -dim_m=2048 -dim_k=2048 -TileSizeK=64 -queue_tiles=1 -globalsize=1152 -localsize=576 &

# 128 TileSize
./matrixvector_queue -timing -magic-memory-copy -report-all -metric-file-name="slurm-2cus-1qt-128" -dim_m=2048 -dim_k=2048 -TileSizeK=128 -queue_tiles=1 -globalsize=1152 -localsize=576 &

# 256 TileSize
./matrixvector_queue -timing -magic-memory-copy -report-all -metric-file-name="slurm-2cus-1qt-256" -dim_m=2048 -dim_k=2048 -TileSizeK=256 -queue_tiles=1 -globalsize=1152 -localsize=576 &

# 512 TileSize
./matrixvector_queue -timing -magic-memory-copy -report-all -metric-file-name="slurm-2cus-1qt-512" -dim_m=2048 -dim_k=2048 -TileSizeK=512 -queue_tiles=1 -globalsize=1152 -localsize=576 &

wait

# Finish the script
exit 0
