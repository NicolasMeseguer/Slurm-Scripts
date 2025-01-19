#!/bin/bash -l

##############################
#       Job blueprint        #
##############################

# Give your job a name, so you can recognize it in the queue overview
#SBATCH --job-name=tma_cartesian_stationary_queue_1cu_512
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=12

# You may not place any commands before the last SBATCH directive

############################
#       Actual work        #
############################

cd /home/nmeseguer/mgpusim/samples/tma

# cartesian - No TMA
cd ./cartesian_stationary_queue

go build

# 512 TileSize
./cartesian_stationary_queue -timing -report-all -magic-memory-copy -metric-file-name="slurm-1cu-512-512-8-8" -length_a=4096 -length_b=4096 -tilesize_a=512 -tilesize_b=512 -queue_tiles_a=8 -queue_tiles_b=8 -globalsize=576 -localsize=576 -gpu-model="$1" &

# 1024 TileSize
./cartesian_stationary_queue -timing -report-all -magic-memory-copy -metric-file-name="slurm-1cu-512-1024-8-4" -length_a=4096 -length_b=4096 -tilesize_a=512 -tilesize_b=1024 -queue_tiles_a=8 -queue_tiles_b=4 -globalsize=576 -localsize=576 -gpu-model="$1" &

# 2048 TileSize
./cartesian_stationary_queue -timing -report-all -magic-memory-copy -metric-file-name="slurm-1cu-512-2048-8-2" -length_a=4096 -length_b=4096 -tilesize_a=512 -tilesize_b=2048 -queue_tiles_a=8 -queue_tiles_b=2 -globalsize=576 -localsize=576 -gpu-model="$1" &

# 4096 TileSize
./cartesian_stationary_queue -timing -report-all -magic-memory-copy -metric-file-name="slurm-1cu-512-4096-8-1" -length_a=4096 -length_b=4096 -tilesize_a=512 -tilesize_b=4096 -queue_tiles_a=8 -queue_tiles_b=1 -globalsize=576 -localsize=576 -gpu-model="$1" &

wait

# Create the $1 directory if it does not exist
mkdir -p $1

# Move the csv files to the $1 directory
mv slurm-* $1

# Finish the script
exit 0
