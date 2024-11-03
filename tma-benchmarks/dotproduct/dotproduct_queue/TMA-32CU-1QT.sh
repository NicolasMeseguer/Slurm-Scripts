#!/bin/bash -l

##############################
#       Job blueprint        #
##############################

# Give your job a name, so you can recognize it in the queue overview
#SBATCH --job-name=tma_dotproduct_queue_32cus_1qt
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=12

# You may not place any commands before the last SBATCH directive

############################
#       Actual work        #
############################

cd /home/nmeseguer/mgpusim/samples/tma

# Dotproduct - Queue
cd ./dotproduct_queue

go build

# 512 TileSize
./dotproduct_queue -timing -report-all -magic-memory-copy -metric-file-name="slurm-32cus-1qt-512" -length=8388608 -tilesize=512 -queue_tiles=1 -globalsize=18432 -localsize=576 &

# 4096 TileSize
./dotproduct_queue -timing -report-all -magic-memory-copy -metric-file-name="slurm-32cus-1qt-4096" -length=8388608 -tilesize=4096 -queue_tiles=1 -globalsize=18432 -localsize=576 &

wait

# Finish the script
exit 0
