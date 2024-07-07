#!/bin/bash -l

##############################
#       Job blueprint        #
##############################

# Give your job a name, so you can recognize it in the queue overview
#SBATCH --job-name=elementwise

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

# Elementwise
cd /home/nmeseguer/mgpusim/samples/tma

# No TMA
cd ./elementwise_notma

go build

# 1 CU
./elementwise_notma -timing -report-all -metric-file-name="suite-slurm-1cu" -length=65536 -tilesize=8192 -globalsize=512 -localsize=512

# 32 CUs
./elementwise_notma -timing -report-all -metric-file-name="suite-slurm-32cus" -length=1048576 -tilesize=4096 -globalsize=16384 -localsize=512

# TMA
cd ../elementwise

go build

# 1 CU
./elementwise -timing -report-all -metric-file-name="suite-slurm-1cu" -length=65536 -tilesize=8192 -globalsize=640 -localsize=640

# 32 CUs
./elementwise -timing -report-all -metric-file-name="suite-slurm-32cus" -length=1048576 -tilesize=4096 -globalsize=20480 -localsize=640

# Buffering
cd ../elementwise_buffering

go build

# 1 CU
./elementwise_buffering -timing -report-all -metric-file-name="suite-slurm-1cu" -length=65536 -tilesize=8192 -globalsize=640 -localsize=640

# 32 CUs
./elementwise_buffering -timing -report-all -metric-file-name="suite-slurm-32cus" -length=1048576 -tilesize=4096 -globalsize=20480 -localsize=640

# Queue
cd ../elementwise_queue

go build

# 1 CU
./elementwise_queue -timing -report-all -metric-file-name="suite-slurm-1cu" -length=65536 -tilesize=8192 -globalsize=640 -localsize=640

# 32 CUs
./elementwise_queue -timing -report-all -metric-file-name="suite-slurm-32cus" -length=1048576 -tilesize=4096 -globalsize=20480 -localsize=640

# Queue configurator
cd ../elementwise_queue_configurator

go build

# 1 CU
./elementwise_queue_configurator -timing -report-all -metric-file-name="suite-slurm-1cu" -length=65536 -globalsize=640 -localsize=640

# 32 CUs
./elementwise_queue_configurator -timing -report-all -metric-file-name="suite-slurm-32cus" -length=1048576 -globalsize=20480 -localsize=640


# Finish the script
exit 0
