#!/bin/bash -l

##############################
#       Job blueprint        #
##############################

# Give your job a name, so you can recognize it in the queue overview
#SBATCH --job-name=tma_cartesian_notma_8cus
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=12

# You may not place any commands before the last SBATCH directive

############################
#       Actual work        #
############################

cd /home/nmeseguer/mgpusim/samples/tma

# cartesian - No TMA
cd ./cartesian_notma

go build

# 512 TileSize
./cartesian_notma -timing -report-all -magic-memory-copy -metric-file-name="slurm-8cus-512" -length_a=32768 -length_b=4096 -tilesize_a=512 -tilesize_b=512 -globalsize=4096 -localsize=512 -gpu-model="$1" &

# 1024 TileSize
./cartesian_notma -timing -report-all -magic-memory-copy -metric-file-name="slurm-8cus-1024" -length_a=32768 -length_b=4096 -tilesize_a=1024 -tilesize_b=1024 -globalsize=4096 -localsize=512 -gpu-model="$1" &

# 2048 TileSize
./cartesian_notma -timing -report-all -magic-memory-copy -metric-file-name="slurm-8cus-2048" -length_a=32768 -length_b=4096 -tilesize_a=2048 -tilesize_b=2048 -globalsize=4096 -localsize=512 -gpu-model="$1" &

wait

# Create the $1 directory if it does not exist
mkdir $1

# Move the csv files to the $1 directory
mv slurm-* $1

# Finish the script
exit 0
