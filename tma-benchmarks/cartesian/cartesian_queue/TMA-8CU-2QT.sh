#!/bin/bash -l

##############################
#       Job blueprint        #
##############################

# Give your job a name, so you can recognize it in the queue overview
#SBATCH --job-name=tma_cartesian_queue_8cus_2qt
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=12

# You may not place any commands before the last SBATCH directive

############################
#       Actual work        #
############################

cd /home/nmeseguer/mgpusim/samples/tma

# cartesian - Queue
cd ./cartesian_queue

go build

# 512 TileSize
./cartesian_queue -timing -report-all -magic-memory-copy -metric-file-name="slurm-8cus-2qt-512" -length_a=32768 -length_b=4096 -tilesize_a=512 -tilesize_b=512 -queue_tiles=2 -globalsize=4608 -localsize=576 &

# 1024 TileSize
./cartesian_queue -timing -report-all -magic-memory-copy -metric-file-name="slurm-8cus-2qt-1024" -length_a=32768 -length_b=4096 -tilesize_a=1024 -tilesize_b=1024 -queue_tiles=2 -globalsize=4608 -localsize=576 &

# 2048 TileSize
./cartesian_queue -timing -report-all -magic-memory-copy -metric-file-name="slurm-8cus-2qt-2048" -length_a=32768 -length_b=4096 -tilesize_a=2048 -tilesize_b=2048 -queue_tiles=2 -globalsize=4608 -localsize=576 &

wait

# Finish the script
exit 0
