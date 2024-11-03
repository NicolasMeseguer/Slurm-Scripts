#!/bin/bash -l

##############################
#       Job blueprint        #
##############################

#SBATCH --job-name=tma_elementwise_8cus
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=8

# You may not place any commands before the last SBATCH directive

############################
#       Actual work        #
############################

cd /home/nmeseguer/mgpusim/samples/tma

# Elementwise - TMA
cd ./elementwise

go build

# 512 TileSize
./elementwise -timing -report-all -magic-memory-copy -metric-file-name="slurm-8cus-512" -length=2097152 -tilesize=512 -globalsize=5120 -localsize=640 &

# 1024 TileSize
./elementwise -timing -report-all -magic-memory-copy -metric-file-name="slurm-8cus-1024" -length=2097152 -tilesize=1024 -globalsize=5120 -localsize=640 &

# 2048 TileSize
./elementwise -timing -report-all -magic-memory-copy -metric-file-name="slurm-8cus-2048" -length=2097152 -tilesize=2048 -globalsize=5120 -localsize=640 &

# 4096 TileSize
./elementwise -timing -report-all -magic-memory-copy -metric-file-name="slurm-8cus-4096" -length=2097152 -tilesize=4096 -globalsize=5120 -localsize=640 &

# 8192 TileSize
./elementwise -timing -report-all -magic-memory-copy -metric-file-name="slurm-8cus-8192" -length=2097152 -tilesize=8192 -globalsize=5120 -localsize=640 &

wait

# Finish the script
exit 0
