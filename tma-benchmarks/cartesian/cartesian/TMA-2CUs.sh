#!/bin/bash -l

##############################
#       Job blueprint        #
##############################

# Give your job a name, so you can recognize it in the queue overview
#SBATCH --job-name=tma_cartesian_2cus
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=12

# You may not place any commands before the last SBATCH directive

############################
#       Actual work        #
############################

cd /home/nmeseguer/mgpusim/samples/tma

# cartesian - TMA
cd ./cartesian

go build

# 512 TileSize
./cartesian -timing -report-all -magic-memory-copy -metric-file-name="slurm-2cus-512" -length_a=8192 -length_b=4096 -tilesize_a=512 -tilesize_b=512 -globalsize=1152 -localsize=576 -gpu-model="$1" &

# 1024 TileSize
./cartesian -timing -report-all -magic-memory-copy -metric-file-name="slurm-2cus-1024" -length_a=8192 -length_b=4096 -tilesize_a=1024 -tilesize_b=1024 -globalsize=1152 -localsize=576 -gpu-model="$1" &

# 2048 TileSize
./cartesian -timing -report-all -magic-memory-copy -metric-file-name="slurm-2cus-2048" -length_a=8192 -length_b=4096 -tilesize_a=2048 -tilesize_b=2048 -globalsize=1152 -localsize=576 -gpu-model="$1" &

wait

# Create the $1 directory if it does not exist
mkdir -p $1

# Move the csv files to the $1 directory
mv slurm-1cu-* $1

# Finish the script
exit 0
