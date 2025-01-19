#!/bin/bash -l

##############################
#       Job blueprint        #
##############################

#SBATCH --job-name=tma_elementwise_queue_4cus_1qt
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=8

# You may not place any commands before the last SBATCH directive

############################
#       Actual work        #
############################

cd /home/nmeseguer/mgpusim/samples/tma

# Elementwise - Queue
cd ./elementwise_queue

go build

# 512 TileSize
./elementwise_queue -timing -report-all -magic-memory-copy -metric-file-name="slurm-4cus-1qt-512" -length=1048576 -tilesize=512 -queue_tiles=1 -globalsize=2560 -localsize=640 -gpu-model="$1" &

# 1024 TileSize
./elementwise_queue -timing -report-all -magic-memory-copy -metric-file-name="slurm-4cus-1qt-1024" -length=1048576 -tilesize=1024 -queue_tiles=1 -globalsize=2560 -localsize=640 -gpu-model="$1" &

# 2048 TileSize
./elementwise_queue -timing -report-all -magic-memory-copy -metric-file-name="slurm-4cus-1qt-2048" -length=1048576 -tilesize=2048 -queue_tiles=1 -globalsize=2560 -localsize=640 -gpu-model="$1" &

# 4096 TileSize
./elementwise_queue -timing -report-all -magic-memory-copy -metric-file-name="slurm-4cus-1qt-4096" -length=1048576 -tilesize=4096 -queue_tiles=1 -globalsize=2560 -localsize=640 -gpu-model="$1" &

# 8192 TileSize
./elementwise_queue -timing -report-all -magic-memory-copy -metric-file-name="slurm-4cus-1qt-8192" -length=1048576 -tilesize=8192 -queue_tiles=1 -globalsize=2560 -localsize=640 -gpu-model="$1" &

wait

# Create the $1 directory if it does not exist
mkdir -p $1

# Move the csv files to the $1 directory
mv slurm-1cu-* $1

# Finish the script
exit 0
