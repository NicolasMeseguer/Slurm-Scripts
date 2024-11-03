#!/bin/bash -l

##############################
#       Job blueprint        #
##############################

# Give your job a name, so you can recognize it in the queue overview
#SBATCH --job-name=tma_cartesian_notma_2cus

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

# cartesian - No TMA
cd ./cartesian_notma

go build

# 512 TileSize
./cartesian_notma -timing -report-all -magic-memory-copy -metric-file-name="slurm-2cus-512" -length_a=4096 -length_b=4096 -tilesize_a=512 -tilesize_b=512 -globalsize=1024 -localsize=512 &

# 1024 TileSize
./cartesian_notma -timing -report-all -magic-memory-copy -metric-file-name="slurm-2cus-1024" -length_a=4096 -length_b=4096 -tilesize_a=1024 -tilesize_b=1024 -globalsize=1024 -localsize=512 &

# 2048 TileSize
./cartesian_notma -timing -report-all -magic-memory-copy -metric-file-name="slurm-2cus-2048" -length_a=4096 -length_b=4096 -tilesize_a=2048 -tilesize_b=2048 -globalsize=1024 -localsize=512 &

wait

# Finish the script
exit 0
