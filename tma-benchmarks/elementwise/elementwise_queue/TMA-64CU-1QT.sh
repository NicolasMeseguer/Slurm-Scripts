#!/bin/bash -l

##############################
#       Job blueprint        #
##############################

#SBATCH --job-name=tma_elementwise_queue_64cus_1qt
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=4

# You may not place any commands before the last SBATCH directive

############################
#       Actual work        #
############################

cd /home/nmeseguer/mgpusim/samples/tma

# Elementwise - Queue
cd ./elementwise_queue

go build

# 512 TileSize
./elementwise_queue -timing -report-all -magic-memory-copy -metric-file-name="slurm-64cus-1qt-512" -length=16777216 -tilesize=512 -queue_tiles=1 -globalsize=40960 -localsize=640 &

# 8192 TileSize
./elementwise_queue -timing -report-all -magic-memory-copy -metric-file-name="slurm-64cus-1qt-8192" -length=16777216 -tilesize=8192 -queue_tiles=1 -globalsize=40960 -localsize=640 &

wait

# Finish the script
exit 0
