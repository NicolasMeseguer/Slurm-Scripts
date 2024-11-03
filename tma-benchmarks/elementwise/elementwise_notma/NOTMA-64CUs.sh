#!/bin/bash -l

##############################
#       Job blueprint        #
##############################

#SBATCH --job-name=tma_elementwise_notma_64cus
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=4

# You may not place any commands before the last SBATCH directive

############################
#       Actual work        #
############################

cd /home/nmeseguer/mgpusim/samples/tma

# Elementwise - No TMA
cd ./elementwise_notma

go build

# 512 TileSize
./elementwise_notma -timing -report-all -magic-memory-copy -metric-file-name="slurm-64cus-512" -length=16777216 -tilesize=512 -globalsize=32768 -localsize=512 &

# 8192 TileSize
./elementwise_notma -timing -report-all -magic-memory-copy -metric-file-name="slurm-64cus-8192" -length=16777216 -tilesize=8192 -globalsize=32768 -localsize=512 &

wait

# Finish the script
exit 0
