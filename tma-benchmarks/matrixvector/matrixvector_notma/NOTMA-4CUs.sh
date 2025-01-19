#!/bin/bash -l

##############################
#       Job blueprint        #
##############################

#SBATCH --job-name=tma_matrixvector_notma_4cus
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

# 64 TileSize
./matrixvector_notma -timing -report-all -metric-file-name="slurm-4cus-64" -dim_m=2048 -dim_k=2048 -TileSizeK=64 -globalsize=2048 -localsize=512 -gpu-model="$1" &

# 128 TileSize
./matrixvector_notma -timing -report-all -metric-file-name="slurm-4cus-128" -dim_m=2048 -dim_k=2048 -TileSizeK=128 -globalsize=2048 -localsize=512 -gpu-model="$1" &

# 256 TileSize
./matrixvector_notma -timing -report-all -metric-file-name="slurm-4cus-256" -dim_m=2048 -dim_k=2048 -TileSizeK=256 -globalsize=2048 -localsize=512 -gpu-model="$1" &

# 512 TileSize
./matrixvector_notma -timing -report-all -metric-file-name="slurm-4cus-512" -dim_m=2048 -dim_k=2048 -TileSizeK=512 -globalsize=2048 -localsize=512 -gpu-model="$1" &

wait

# Create the $1 directory if it does not exist
mkdir -p $1

# Move the csv files to the $1 directory
mv slurm-* $1

# Finish the script
exit 0
