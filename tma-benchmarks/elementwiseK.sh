#!/bin/bash -l

##############################
#       Job blueprint        #
##############################

# Give your job a name, so you can recognize it in the queue overview
#SBATCH --job-name=elementwiseK

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

# Elementwise K
cd /home/nmeseguer/mgpusim/samples/tma

# No TMA
cd ./elementwiseK_notma

go build

# 1 CU
./elementwiseK_notma -timing -report-all -metric-file-name="suite-slurm-1cu" -length=65536 -tilesize=8192 -globalsize=512 -localsize=512

# 32 CUs
./elementwiseK_notma -timing -report-all -metric-file-name="suite-slurm-32cus" -length=1048576 -tilesize=4096 -globalsize=16384 -localsize=512

# TMA
cd ../elementwiseK

go build

# 1 CU
./elementwiseK -timing -report-all -metric-file-name="suite-slurm-1cu" -length=65536 -tilesize=8192 -globalsize=576 -localsize=576

# 32 CUs
./elementwiseK -timing -report-all -metric-file-name="suite-slurm-32cus" -length=1048576 -tilesize=4096 -globalsize=18432 -localsize=576

# Buffering
cd ../elementwiseK_buffering

go build

# 1 CU
./elementwiseK_buffering -timing -report-all -metric-file-name="suite-slurm-1cu" -length=65536 -tilesize=8192 -globalsize=576 -localsize=576

# 32 CUs
./elementwiseK_buffering -timing -report-all -metric-file-name="suite-slurm-32cus" -length=1048576 -tilesize=4096 -globalsize=18432 -localsize=576

# Queue
cd ../elementwiseK_queue

go build

# 1 CU
./elementwiseK_queue -timing -report-all -metric-file-name="suite-slurm-1cu" -length=65536 -tilesize=8192 -globalsize=576 -localsize=576

# 32 CUs
./elementwiseK_queue -timing -report-all -metric-file-name="suite-slurm-32cus" -length=1048576 -tilesize=4096 -globalsize=18432 -localsize=576

# Queue configurator
cd ../elementwiseK_queue_configurator

go build

# 1 CU
./elementwiseK_queue_configurator -timing -report-all -metric-file-name="suite-slurm-1cu" -length=65536 -globalsize=576 -localsize=576

# 32 CUs
./elementwiseK_queue_configurator -timing -report-all -metric-file-name="suite-slurm-32cus" -length=1048576 -globalsize=18432 -localsize=576


# Finish the script
exit 0
