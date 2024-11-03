#!/bin/bash -l

##############################
#       Job blueprint        #
##############################

# Give your job a name, so you can recognize it in the queue overview
#SBATCH --job-name=tma_elementwiseK_queue_64cus_2qt
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=2

# You may not place any commands before the last SBATCH directive

############################
#       Actual work        #
############################

cd /home/nmeseguer/mgpusim/samples/tma

# Elementwise K - Queue
cd ./elementwiseK_queue

go build

# 2048 TileSize
./elementwiseK_queue -timing -report-all -magic-memory-copy -metric-file-name="slurm-64cus-2qt-2048" -length=16777216 -tilesize=2048 -queue_tiles=2 -globalsize=36864 -localsize=576 &

wait

# Finish the script
exit 0
