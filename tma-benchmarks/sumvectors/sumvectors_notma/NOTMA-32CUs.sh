#!/bin/bash -l

##############################
#       Job blueprint        #
##############################

#SBATCH --job-name=tma_sumvectors_notma_32cus
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=4

# You may not place any commands before the last SBATCH directive

############################
#       Actual work        #
############################

cd /home/nmeseguer/mgpusim/samples/tma

# sumvectors - No TMA
cd ./sumvectors_notma

go build

# 512 TileSize
./sumvectors_notma -timing -report-all -magic-memory-copy -metric-file-name="slurm-32cus-512" -length=8388608 -tilesize=512 -globalsize=16384 -localsize=512 -gpu-model="$1" &

# 8192 TileSize
./sumvectors_notma -timing -report-all -magic-memory-copy -metric-file-name="slurm-32cus-8192" -length=8388608 -tilesize=8192 -globalsize=16384 -localsize=512 -gpu-model="$1" &

wait

# Create the $1 directory if it does not exist
mkdir -p $1

# Move the csv files to the $1 directory
mv slurm-1cu-* $1

# Finish the script
exit 0
