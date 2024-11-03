#!/bin/bash -l

##############################
#       Job blueprint        #
##############################

# Give your job a name, so you can recognize it in the queue overview
#SBATCH --job-name=tma_dotproduct_notma_2cus
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=8

# You may not place any commands before the last SBATCH directive

############################
#       Actual work        #
############################

cd /home/nmeseguer/mgpusim/samples/tma

# Dotproduct - No TMA
cd ./dotproduct_notma

go build

# 512 TileSize
./dotproduct_notma -timing -report-all -magic-memory-copy -metric-file-name="slurm-2cus-512" -length=524288 -tilesize=512 -globalsize=1024 -localsize=512 &

# 1024 TileSize
./dotproduct_notma -timing -report-all -magic-memory-copy -metric-file-name="slurm-2cus-1024" -length=524288 -tilesize=1024 -globalsize=1024 -localsize=512 &

# 2048 TileSize
./dotproduct_notma -timing -report-all -magic-memory-copy -metric-file-name="slurm-2cus-2048" -length=524288 -tilesize=2048 -globalsize=1024 -localsize=512 &

# 4096 TileSize
./dotproduct_notma -timing -report-all -magic-memory-copy -metric-file-name="slurm-2cus-4096" -length=524288 -tilesize=4096 -globalsize=1024 -localsize=512 &

wait

# Finish the script
exit 0
