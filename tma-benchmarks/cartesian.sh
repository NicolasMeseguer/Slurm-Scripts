#!/bin/bash -l

##############################
#       Job blueprint        #
##############################

# Give your job a name, so you can recognize it in the queue overview
#SBATCH --job-name=cartesian

# Define, how many nodes you need. Here, we ask for 1 node since we have a single-node machine.
#SBATCH --nodes=1
# We want to launch 1 task.
#SBATCH --ntasks=1
# We want to use all the cores of the node.
#SBATCH --cpus-per-task=1

# You may not place any commands before the last SBATCH directive

############################
#       Actual work        #
############################

# Cartesian
cd /home/nmeseguer/mgpusim/samples/tma

# No TMA
cd ./cartesian_notma

go build

# 1 CU
./cartesian_notma -timing -report-all -verify -metric-file-name="suite-slurm-1cu-no-stores" -length_a=8192 -length_b=2048 -tilesize_a=1024 -tilesize_b=1024 -globalsize=512 -localsize=512
# ./cartesian_notma -timing -report-all -verify -metric-file-name="suite-slurm-1cu" -length_a=8192 -length_b=2048 -tilesize_a=1024 -tilesize_b=1024 -globalsize=512 -localsize=512

# 32 CUs
./cartesian_notma -timing -report-all -verify -metric-file-name="suite-slurm-32cus" -length_a=65536 -length_b=2048 -tilesize_a=512 -tilesize_b=512 -globalsize=16384 -localsize=512

# TMA
cd ../cartesian

go build

# 1 CU
./cartesian -timing -report-all -verify -metric-file-name="suite-slurm-1cu-no-stores" -length_a=8192 -length_b=2048 -tilesize_a=1024 -tilesize_b=1024 -globalsize=576 -localsize=576
# ./cartesian -timing -report-all -verify -metric-file-name="suite-slurm-1cu" -length_a=8192 -length_b=2048 -tilesize_a=1024 -tilesize_b=1024 -globalsize=576 -localsize=576

# 32 CUs
# ./cartesian -timing -report-all -verify -metric-file-name="suite-slurm-32cus" -length_a=65536 -length_b=2048 -tilesize_a=512 -tilesize_b=512 -globalsize=18432 -localsize=576

# Buffering
cd ../cartesian_buffering

go build

# 1 CU
./cartesian_buffering -timing -report-all -verify -metric-file-name="suite-slurm-1cu-no-stores" -length_a=8192 -length_b=2048 -tilesize_a=1024 -tilesize_b=1024 -globalsize=576 -localsize=576
# ./cartesian_buffering -timing -report-all -verify -metric-file-name="suite-slurm-1cu" -length_a=8192 -length_b=2048 -tilesize_a=1024 -tilesize_b=1024 -globalsize=576 -localsize=576

# 32 
# ./cartesian_buffering -timing -report-all -verify -metric-file-name="suite-slurm-32cus" -length_a=65536 -length_b=2048 -tilesize_a=512 -tilesize_b=512 -globalsize=18432 -localsize=576

# Queue
cd ../cartesian_queue

go build

# 1 CU
./cartesian_queue -timing -report-all -verify -metric-file-name="suite-slurm-1cu-no-stores" -length_a=8192 -length_b=2048 -tilesize_a=1024 -tilesize_b=1024 -globalsize=576 -localsize=576
# ./cartesian_queue -timing -report-all -verify -metric-file-name="suite-slurm-1cu" -length_a=8192 -length_b=2048 -tilesize_a=1024 -tilesize_b=1024 -globalsize=576 -localsize=576

# 32 CUs
# ./cartesian_queue -timing -report-all -verify -metric-file-name="suite-slurm-32cus" -length_a=65536 -length_b=2048 -tilesize_a=512 -tilesize_b=512 -globalsize=18432 -localsize=576

# Queue configurator
cd ../cartesian_queue_configurator

go build

# 1 CU
./cartesian_queue_configurator -timing -report-all -verify -metric-file-name="suite-slurm-1cu-no-stores" -length_a=8192 -length_b=2048 -globalsize=576 -localsize=576
# ./cartesian_queue_configurator -timing -report-all -verify -metric-file-name="suite-slurm-1cu" -length_a=8192 -length_b=2048 -globalsize=576 -localsize=576

# 32 CUs
# ./cartesian_queue_configurator -timing -report-all -verify -metric-file-name="suite-slurm-32cus" -length_a=65536 -length_b=2048 -globalsize=18432 -localsize=576

# Finish the script
exit 0
