#!/bin/bash -l

##############################
#       Job blueprint        #
##############################

#SBATCH --job-name=tma_sumvectors_queue_32cus_1qt
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
./sumvectors_queue -timing -report-all -magic-memory-copy -metric-file-name="slurm-32cus-1qt-512" -length=8388608 -tilesize=512 -queue_tiles=1 -globalsize=20480 -localsize=640 -gpu-model="$1" &

# 8192 TileSize
./sumvectors_queue -timing -report-all -magic-memory-copy -metric-file-name="slurm-32cus-1qt-8192" -length=8388608 -tilesize=8192 -queue_tiles=1 -globalsize=20480 -localsize=640 -gpu-model="$1" &

wait

# Create the $1 directory if it does not exist
mkdir -p $1

# Move the csv files to the $1 directory
mv slurm-1cu-* $1

# Finish the script
exit 0
