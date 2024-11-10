#!/bin/bash -l

##############################
#       Job blueprint        #
##############################

#SBATCH --job-name=tma_matrixvector_notma_16cus
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=12

# You may not place any commands before the last SBATCH directive

############################
#       Actual work        #
############################

# MatrixVector
cd /home/nmeseguer/mgpusim/samples/tma

# MatrixVector - No TMA
cd ./matrixvector_notma

go build

# 256 TileSize
./matrixvector_notma -timing -report-all -metric-file-name="slurm-16cus-256" -dim_m=2048 -dim_k=2048 -TileSizeK=256 -globalsize=8192 -localsize=512 &

# 512 TileSize
./matrixvector_notma -timing -report-all -metric-file-name="slurm-16cus-512" -dim_m=2048 -dim_k=2048 -TileSizeK=512 -globalsize=8192 -localsize=512 &

wait

# Finish the script
exit 0
