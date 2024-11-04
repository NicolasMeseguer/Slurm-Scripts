#!/bin/bash -l

##############################
#       Job blueprint        #
##############################

# Give your job a name, so you can recognize it in the queue overview
#SBATCH --job-name=tma_dotproduct_1cu
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=8

# You may not place any commands before the last SBATCH directive

############################
#       Actual work        #
############################

cd /home/nmeseguer/mgpusim/samples/tma

# Dotproduct - TMA
cd ./dotproduct

go build

# 512 TileSize
./dotproduct -timing -report-all -magic-memory-copy -metric-file-name="slurm-1cu-512" -length=2097152 -tilesize=512 -globalsize=576 -localsize=576 &

# 1024 TileSize
./dotproduct -timing -report-all -magic-memory-copy -metric-file-name="slurm-1cu-1024" -length=2097152 -tilesize=1024 -globalsize=576 -localsize=576 &

# 2048 TileSize
./dotproduct -timing -report-all -magic-memory-copy -metric-file-name="slurm-1cu-2048" -length=2097152 -tilesize=2048 -globalsize=576 -localsize=576 &

# 4096 TileSize
./dotproduct -timing -report-all -magic-memory-copy -metric-file-name="slurm-1cu-4096" -length=2097152 -tilesize=4096 -globalsize=576 -localsize=576 &

# 8192 TileSize
./dotproduct -timing -report-all -magic-memory-copy -metric-file-name="slurm-1cu-8192" -length=2097152 -tilesize=8192 -globalsize=576 -localsize=576 &

wait

# Finish the script
exit 0
