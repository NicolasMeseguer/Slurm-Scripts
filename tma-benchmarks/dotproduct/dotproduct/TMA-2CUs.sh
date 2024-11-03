#!/bin/bash -l

##############################
#       Job blueprint        #
##############################

# Give your job a name, so you can recognize it in the queue overview
#SBATCH --job-name=tma_dotproduct_2cus

# Define, how many nodes you need. Here, we ask for 1 node since we have a single-node machine.
#SBATCH --nodes=1
# We want to launch 1 task.
#SBATCH --ntasks=1
# We want to use all the cores of the node.
#SBATCH --cpus-per-task=24

# You may not place any commands before the last SBATCH directive

############################
#       Actual work        #
############################

cd /home/nmeseguer/mgpusim/samples/tma

# Dotproduct - TMA
cd ./dotproduct

go build

# 512 TileSize
./dotproduct -timing -report-all -magic-memory-copy -metric-file-name="slurm-2cus-512" -length=524288 -tilesize=512 -globalsize=1152 -localsize=576 &

# 1024 TileSize
./dotproduct -timing -report-all -magic-memory-copy -metric-file-name="slurm-2cus-1024" -length=524288 -tilesize=1024 -globalsize=1152 -localsize=576 &

# 2048 TileSize
./dotproduct -timing -report-all -magic-memory-copy -metric-file-name="slurm-2cus-2048" -length=524288 -tilesize=2048 -globalsize=1152 -localsize=576 &

# 4096 TileSize
./dotproduct -timing -report-all -magic-memory-copy -metric-file-name="slurm-2cus-4096" -length=524288 -tilesize=4096 -globalsize=1152 -localsize=576 &

# 8192 TileSize
./dotproduct -timing -report-all -magic-memory-copy -metric-file-name="slurm-2cus-8192" -length=524288 -tilesize=8192 -globalsize=1152 -localsize=576 &

wait

# Finish the script
exit 0
