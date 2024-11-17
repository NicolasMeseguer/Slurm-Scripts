#!/bin/bash -l

##############################
#       Job blueprint        #
##############################

# Give your job a name, so you can recognize it in the queue overview
#SBATCH --job-name=tma_cartesian_stationary_notma_1cu_1024
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=12

# You may not place any commands before the last SBATCH directive

############################
#       Actual work        #
############################

cd /home/nmeseguer/mgpusim/samples/tma

# cartesian - No TMA
cd ./cartesian_stationary_notma

go build

# 512 TileSize
./cartesian_stationary_notma -timing -report-all -magic-memory-copy -metric-file-name="slurm-1cu-1024-512" -length_a=4096 -length_b=4096 -tilesize_a=1024 -tilesize_b=512 -globalsize=512 -localsize=512 &

# 1024 TileSize
./cartesian_stationary_notma -timing -report-all -magic-memory-copy -metric-file-name="slurm-1cu-1024-1024" -length_a=4096 -length_b=4096 -tilesize_a=1024 -tilesize_b=1024 -globalsize=512 -localsize=512 &

# 2048 TileSize
./cartesian_stationary_notma -timing -report-all -magic-memory-copy -metric-file-name="slurm-1cu-1024-2048" -length_a=4096 -length_b=4096 -tilesize_a=1024 -tilesize_b=2048 -globalsize=512 -localsize=512 &

# 4096 TileSize
./cartesian_stationary_notma -timing -report-all -magic-memory-copy -metric-file-name="slurm-1cu-1024-4096" -length_a=4096 -length_b=4096 -tilesize_a=1024 -tilesize_b=4096 -globalsize=512 -localsize=512 &

wait

# Finish the script
exit 0
