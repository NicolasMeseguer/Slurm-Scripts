#!/bin/bash -l

##############################
#       Job blueprint        #
##############################

#SBATCH --job-name=tma_elementwiseK_queue_2cus_4qt
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
./elementwiseK_queue -timing -report-all -magic-memory-copy -metric-file-name="slurm-2cus-4qt-512" -length=524288 -tilesize=512 -queue_tiles=4 -globalsize=1152 -localsize=576 &

# 1024 TileSize
./elementwiseK_queue -timing -report-all -magic-memory-copy -metric-file-name="slurm-2cus-4qt-1024" -length=524288 -tilesize=1024 -queue_tiles=4 -globalsize=1152 -localsize=576 &

# 2048 TileSize
./elementwiseK_queue -timing -report-all -magic-memory-copy -metric-file-name="slurm-2cus-4qt-2048" -length=524288 -tilesize=2048 -queue_tiles=4 -globalsize=1152 -localsize=576 &

# 4096 TileSize
./elementwiseK_queue -timing -report-all -magic-memory-copy -metric-file-name="slurm-2cus-4qt-4096" -length=524288 -tilesize=4096 -queue_tiles=4 -globalsize=1152 -localsize=576 &

# 8192 TileSize
./elementwiseK_queue -timing -report-all -magic-memory-copy -metric-file-name="slurm-2cus-4qt-8192" -length=524288 -tilesize=8192 -queue_tiles=4 -globalsize=1152 -localsize=576 &

wait

# Finish the script
exit 0
