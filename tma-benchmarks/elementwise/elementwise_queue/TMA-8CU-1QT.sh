#!/bin/bash -l

##############################
#       Job blueprint        #
##############################

#SBATCH --job-name=tma_elementwise_queue_8cus_1qt
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=8

# You may not place any commands before the last SBATCH directive

############################
#       Actual work        #
############################

cd /home/nmeseguer/mgpusim/samples/tma

# Elementwise - Queue
cd ./elementwise_queue

go build

# 512 TileSize
./elementwise_queue -timing -report-all -magic-memory-copy -metric-file-name="slurm-8cus-1qt-512" -length=2097152 -tilesize=512 -queue_tiles=1 -globalsize=5120 -localsize=640 &

# 1024 TileSize
./elementwise_queue -timing -report-all -magic-memory-copy -metric-file-name="slurm-8cus-1qt-1024" -length=2097152 -tilesize=1024 -queue_tiles=1 -globalsize=5120 -localsize=640 &

# 2048 TileSize
./elementwise_queue -timing -report-all -magic-memory-copy -metric-file-name="slurm-8cus-1qt-2048" -length=2097152 -tilesize=2048 -queue_tiles=1 -globalsize=5120 -localsize=640 &

# 4096 TileSize
./elementwise_queue -timing -report-all -magic-memory-copy -metric-file-name="slurm-8cus-1qt-4096" -length=2097152 -tilesize=4096 -queue_tiles=1 -globalsize=5120 -localsize=640 &

# 8192 TileSize
./elementwise_queue -timing -report-all -magic-memory-copy -metric-file-name="slurm-8cus-1qt-8192" -length=2097152 -tilesize=8192 -queue_tiles=1 -globalsize=5120 -localsize=640 &

wait

# Finish the script
exit 0
