#!/bin/bash -l

##############################
#       Job blueprint        #
##############################

#SBATCH --job-name=tma_elementwiseK_queue_8cus_2qt
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=8

# You may not place any commands before the last SBATCH directive

############################
#       Actual work        #
############################

cd /home/nmeseguer/mgpusim/samples/tma

# Elementwise K - Queue
cd ./elementwiseK_queue

go build

# 512 TileSize
./elementwiseK_queue -timing -report-all -magic-memory-copy -metric-file-name="slurm-8cus-2qt-512" -length=2097152 -tilesize=512 -queue_tiles=2 -globalsize=4608 -localsize=576 -gpu-model="$1" &

# 1024 TileSize
./elementwiseK_queue -timing -report-all -magic-memory-copy -metric-file-name="slurm-8cus-2qt-1024" -length=2097152 -tilesize=1024 -queue_tiles=2 -globalsize=4608 -localsize=576 -gpu-model="$1" &

# 2048 TileSize
./elementwiseK_queue -timing -report-all -magic-memory-copy -metric-file-name="slurm-8cus-2qt-2048" -length=2097152 -tilesize=2048 -queue_tiles=2 -globalsize=4608 -localsize=576 -gpu-model="$1" &

# 4096 TileSize
./elementwiseK_queue -timing -report-all -magic-memory-copy -metric-file-name="slurm-8cus-2qt-4096" -length=2097152 -tilesize=4096 -queue_tiles=2 -globalsize=4608 -localsize=576 -gpu-model="$1" &

# 8192 TileSize
./elementwiseK_queue -timing -report-all -magic-memory-copy -metric-file-name="slurm-8cus-2qt-8192" -length=2097152 -tilesize=8192 -queue_tiles=2 -globalsize=4608 -localsize=576 -gpu-model="$1" &

wait

# Create the $1 directory if it does not exist
mkdir -p $1

# Move the csv files to the $1 directory
mv slurm-* $1

# Finish the script
exit 0
