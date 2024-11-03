#!/bin/bash -l

##############################
#       Job blueprint        #
##############################

# Give your job a name, so you can recognize it in the queue overview
#SBATCH --job-name=tma_dotproduct_queue_16cus_2qt
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

# 1024 TileSize
./dotproduct_queue -timing -report-all -magic-memory-copy -metric-file-name="slurm-16cus-2qt-1024" -length=4194304 -tilesize=1024 -queue_tiles=2 -globalsize=9216 -localsize=576 &

wait

# Finish the script
exit 0
