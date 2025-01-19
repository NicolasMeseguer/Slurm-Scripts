#!/bin/bash -l

##############################
#       Job blueprint        #
##############################

#SBATCH --job-name=tma_sumvectors_1cu
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=8

# You may not place any commands before the last SBATCH directive

############################
#       Actual work        #
############################

cd /home/nmeseguer/mgpusim/samples/tma

# sumvectors - TMA
cd ./sumvectors

go build

# 512 TileSize
./sumvectors -timing -report-all -magic-memory-copy -metric-file-name="slurm-1cu-512" -length=262144 -tilesize=512 -globalsize=640 -localsize=640 -gpu-model="$1" &

# 1024 TileSize
./sumvectors -timing -report-all -magic-memory-copy -metric-file-name="slurm-1cu-1024" -length=262144 -tilesize=1024 -globalsize=640 -localsize=640 -gpu-model="$1" &

# 2048 TileSize
./sumvectors -timing -report-all -magic-memory-copy -metric-file-name="slurm-1cu-2048" -length=262144 -tilesize=2048 -globalsize=640 -localsize=640 -gpu-model="$1" &

# 4096 TileSize
./sumvectors -timing -report-all -magic-memory-copy -metric-file-name="slurm-1cu-4096" -length=262144 -tilesize=4096 -globalsize=640 -localsize=640 -gpu-model="$1" &

# 8192 TileSize
./sumvectors -timing -report-all -magic-memory-copy -metric-file-name="slurm-1cu-8192" -length=262144 -tilesize=8192 -globalsize=640 -localsize=640 -gpu-model="$1" &

wait

# Create the $1 directory if it does not exist
mkdir -p $1

# Move the csv files to the $1 directory
mv slurm-1cu-* $1

# Finish the script
exit 0
