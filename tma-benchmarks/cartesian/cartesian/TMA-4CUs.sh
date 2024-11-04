#!/bin/bash -l

##############################
#       Job blueprint        #
##############################

# Give your job a name, so you can recognize it in the queue overview
#SBATCH --job-name=tma_cartesian_4cus
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=12

# You may not place any commands before the last SBATCH directive

############################
#       Actual work        #
############################

cd /home/nmeseguer/mgpusim/samples/tma

# cartesian - TMA
cd ./cartesian

go build

# 512 TileSize
./cartesian -timing -report-all -magic-memory-copy -metric-file-name="slurm-4cus-512" -length_a=16384 -length_b=4096 -tilesize_a=512 -tilesize_b=512 -globalsize=2304 -localsize=576 &

# 1024 TileSize
./cartesian -timing -report-all -magic-memory-copy -metric-file-name="slurm-4cus-1024" -length_a=16384 -length_b=4096 -tilesize_a=1024 -tilesize_b=1024 -globalsize=2304 -localsize=576 &

# 2048 TileSize
./cartesian -timing -report-all -magic-memory-copy -metric-file-name="slurm-4cus-2048" -length_a=16384 -length_b=4096 -tilesize_a=2048 -tilesize_b=2048 -globalsize=2304 -localsize=576 &

wait

# Finish the script
exit 0
