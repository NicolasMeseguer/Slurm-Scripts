#!/bin/bash -l

##############################
#       Job blueprint        #
##############################

# Give your job a name, so you can recognize it in the queue overview
#SBATCH --job-name=tma_dotproduct_queue_2cus_4qt
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=8

# You may not place any commands before the last SBATCH directive

############################
#       Actual work        #
############################

cd /home/nmeseguer/mgpusim/samples/tma

# Dotproduct - Queue
cd ./dotproduct_queue

go build

# 512 TileSize
./dotproduct_queue -timing -report-all -magic-memory-copy -metric-file-name="slurm-2cus-4qt-512" -length=2097152 -tilesize=512 -queue_tiles=4 -globalsize=1152 -localsize=576 -gpu-model="$1" &

# 1024 TileSize
./dotproduct_queue -timing -report-all -magic-memory-copy -metric-file-name="slurm-2cus-4qt-1024" -length=2097152 -tilesize=1024 -queue_tiles=4 -globalsize=1152 -localsize=576 -gpu-model="$1" &

# 2048 TileSize
./dotproduct_queue -timing -report-all -magic-memory-copy -metric-file-name="slurm-2cus-4qt-2048" -length=2097152 -tilesize=2048 -queue_tiles=4 -globalsize=1152 -localsize=576 -gpu-model="$1" &

# 4096 TileSize
./dotproduct_queue -timing -report-all -magic-memory-copy -metric-file-name="slurm-2cus-4qt-4096" -length=2097152 -tilesize=4096 -queue_tiles=4 -globalsize=1152 -localsize=576 -gpu-model="$1" &

# 8192 TileSize
./dotproduct_queue -timing -report-all -magic-memory-copy -metric-file-name="slurm-2cus-4qt-8192" -length=2097152 -tilesize=8192 -queue_tiles=4 -globalsize=1152 -localsize=576 -gpu-model="$1" &

wait

# Create the $1 directory if it does not exist
mkdir -p $1

# Move the csv files to the $1 directory
mv slurm-1cu-* $1

# Finish the script
exit 0
