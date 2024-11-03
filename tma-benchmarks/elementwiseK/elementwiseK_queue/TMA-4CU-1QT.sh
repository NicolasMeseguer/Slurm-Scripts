#!/bin/bash -l

##############################
#       Job blueprint        #
##############################

#SBATCH --job-name=tma_elementwiseK_queue_4cus_1qt
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
./elementwiseK_queue -timing -report-all -magic-memory-copy -metric-file-name="slurm-4cus-1qt-512" -length=1048576 -tilesize=512 -queue_tiles=1 -globalsize=2304 -localsize=576 &

# 1024 TileSize
./elementwiseK_queue -timing -report-all -magic-memory-copy -metric-file-name="slurm-4cus-1qt-1024" -length=1048576 -tilesize=1024 -queue_tiles=1 -globalsize=2304 -localsize=576 &

# 2048 TileSize
./elementwiseK_queue -timing -report-all -magic-memory-copy -metric-file-name="slurm-4cus-1qt-2048" -length=1048576 -tilesize=2048 -queue_tiles=1 -globalsize=2304 -localsize=576 &

# 4096 TileSize
./elementwiseK_queue -timing -report-all -magic-memory-copy -metric-file-name="slurm-4cus-1qt-4096" -length=1048576 -tilesize=4096 -queue_tiles=1 -globalsize=2304 -localsize=576 &

# 8192 TileSize
./elementwiseK_queue -timing -report-all -magic-memory-copy -metric-file-name="slurm-4cus-1qt-8192" -length=1048576 -tilesize=8192 -queue_tiles=1 -globalsize=2304 -localsize=576 &

wait

# Finish the script
exit 0
