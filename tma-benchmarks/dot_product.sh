#!/bin/bash -l

##############################
#       Job blueprint        #
##############################

# Give your job a name, so you can recognize it in the queue overview
#SBATCH --job-name=dot-product

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

# Dot Product
cd /home/nmeseguer/mgpusim/samples/tma

# No TMA
cd ./dotproduct_notma

go build

# 65536 Elems
./dotproduct_notma -timing -report-all -metric-file-name="suite-slurm-1cu-65536" -length=65536 -tilesize=4096 -globalsize=512 -localsize=512

# 262144 Elems
./dotproduct_notma -timing -report-all -metric-file-name="suite-slurm-1cu-262144" -length=262144 -tilesize=512 -globalsize=512 -localsize=512

# 32768 Elems
./dotproduct_notma -timing -report-all -metric-file-name="suite-slurm-32cus-32768" -length=32768 -tilesize=2048 -globalsize=16384 -localsize=512

# TMA 
cd ../dotproduct

go build

# 65536 Elems
./dotproduct -timing -report-all -metric-file-name="suite-slurm-1cu-65536" -length=65536 -tilesize=4096 -globalsize=576 -localsize=576

# 262144 Elems
./dotproduct -timing -report-all -metric-file-name="suite-slurm-1cu-262144" -length=262144 -tilesize=512 -globalsize=576 -localsize=576

# 32768 Elems
./dotproduct -timing -report-all -metric-file-name="suite-slurm-32cus-32768" -length=32768 -tilesize=2048 -globalsize=18432 -localsize=576

# Buffering
cd ../dotproduct_buffering

go build

# 65536 Elems
./dotproduct_buffering -timing -report-all -metric-file-name="suite-slurm-1cu-65536" -length=65536 -tilesize=4096 -lds_tiles=2 -globalsize=576 -localsize=576

# 262144 Elems
./dotproduct_buffering -timing -report-all -metric-file-name="suite-slurm-1cu-262144" -length=262144 -tilesize=512 -lds_tiles=8 -globalsize=576 -localsize=576

# 32768 Elems
./dotproduct_buffering -timing -report-all -metric-file-name="suite-slurm-32cus-32768" -length=32768 -tilesize=2048 -lds_tiles=2 -globalsize=18432 -localsize=576

# Queue
cd ../dotproduct_queue

go build

# 65536 Elems
./dotproduct_queue -timing -report-all -verify -metric-file-name="suite-slurm-1cu-65536" -length=65536 -tilesize=4096 -queue_tiles=2 -globalsize=576 -localsize=576

# 262144 Elems
./dotproduct_queue -timing -report-all -verify -metric-file-name="suite-slurm-1cu-262144" -length=262144 -tilesize=512 -queue_tiles=8 -globalsize=576 -localsize=576

# 32768 Elems
./dotproduct_queue -timing -report-all -verify -metric-file-name="suite-slurm-32cus-32768" -length=32768 -tilesize=2048 -queue_tiles=2 -globalsize=18432 -localsize=576

# Queue configurator
cd ../dotproduct_queue_configurator

go build

# 65536 Elems
./dotproduct_queue_configurator -timing -report-all -metric-file-name="suite-slurm-1cu-65536" -length=65536 -globalsize=576 -localsize=576

# 262144 Elems
./dotproduct_queue_configurator -timing -report-all -metric-file-name="suite-slurm-1cu-262144" -length=262144 -globalsize=576 -localsize=576

# 32768 Elems
./dotproduct_queue_configurator -timing -report-all -metric-file-name="suite-slurm-32cus-32768" -length=32768 -globalsize=18432 -localsize=576

# Finish the script
exit 0
