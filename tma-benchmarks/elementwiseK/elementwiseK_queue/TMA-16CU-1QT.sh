#!/bin/bash -l

##############################
#       Job blueprint        #
##############################

#SBATCH --job-name=tma_elementwiseK_queue_16cus_1qt
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=4

# You may not place any commands before the last SBATCH directive

############################
#       Actual work        #
############################

cd /home/nmeseguer/mgpusim/samples/tma

# Elementwise K - Queue
cd ./elementwiseK_queue

go build

# 512 TileSize
./elementwiseK_queue -timing -report-all -magic-memory-copy -metric-file-name="slurm-16cus-1qt-512" -length=4194304 -tilesize=512 -queue_tiles=1 -globalsize=9216 -localsize=576 -gpu-model="$1" &

# 8192 TileSize
./elementwiseK_queue -timing -report-all -magic-memory-copy -metric-file-name="slurm-16cus-1qt-8192" -length=4194304 -tilesize=8192 -queue_tiles=1 -globalsize=9216 -localsize=576 -gpu-model="$1" &

wait

# Create the $1 directory if it does not exist
mkdir -p $1

# Move the csv files to the $1 directory
mv slurm-* $1

# Finish the script
exit 0
