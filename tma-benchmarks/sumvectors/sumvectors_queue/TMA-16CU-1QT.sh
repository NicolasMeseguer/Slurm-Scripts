#!/bin/bash -l

##############################
#       Job blueprint        #
##############################

#SBATCH --job-name=tma_sumvectors_queue_16cus_1qt
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=4

# You may not place any commands before the last SBATCH directive

############################
#       Actual work        #
############################

cd /home/nmeseguer/mgpusim/samples/tma

# sumvectors - Queue
cd ./sumvectors_queue

go build

# 512 TileSize
./sumvectors_queue -timing -report-all -magic-memory-copy -metric-file-name="slurm-16cus-1qt-512" -length=4194304 -tilesize=512 -queue_tiles=1 -globalsize=10240 -localsize=640 -gpu-model="$1" &

# 1024 TileSize
./sumvectors_queue -timing -report-all -magic-memory-copy -metric-file-name="slurm-16cus-1qt-1024" -length=4194304 -tilesize=1024 -queue_tiles=1 -globalsize=10240 -localsize=640 -gpu-model="$1" &

# 2048 TileSize
./sumvectors_queue -timing -report-all -magic-memory-copy -metric-file-name="slurm-16cus-1qt-2048" -length=4194304 -tilesize=2048 -queue_tiles=1 -globalsize=10240 -localsize=640 -gpu-model="$1" &

# 4096 TileSize
./sumvectors_queue -timing -report-all -magic-memory-copy -metric-file-name="slurm-16cus-1qt-4096" -length=4194304 -tilesize=4096 -queue_tiles=1 -globalsize=10240 -localsize=640 -gpu-model="$1" &

# 8192 TileSize
./sumvectors_queue -timing -report-all -magic-memory-copy -metric-file-name="slurm-16cus-1qt-8192" -length=4194304 -tilesize=8192 -queue_tiles=1 -globalsize=10240 -localsize=640 -gpu-model="$1" &

wait

# Create the $1 directory if it does not exist
mkdir -p $1

# Move the csv files to the $1 directory
mv slurm-* $1

# Finish the script
exit 0
