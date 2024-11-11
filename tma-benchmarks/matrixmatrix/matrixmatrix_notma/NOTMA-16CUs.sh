#!/bin/bash -l

##############################
#       Job blueprint        #
##############################

# Give your job a name, so you can recognize it in the queue overview
#SBATCH --job-name=tma_matrixmatrix_notma_16cus
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=12

# You may not place any commands before the last SBATCH directive

############################
#       Actual work        #
############################

# MatrixMatrix
cd /home/nmeseguer/mgpusim/samples/tma

# MatrixMatrix - No TMA
cd ./matrixmatrix_notma

go build

# 512 TileSize
./matrixmatrix_notma -timing -report-all -magic-memory-copy -metric-file-name="slurm-16cus-512" -dim_m=512 -dim_k=2048 -dim_n=128 -TileSizeK=512 -globalsize=8192 -localsize=512 &

wait

# Finish the script
exit 0
