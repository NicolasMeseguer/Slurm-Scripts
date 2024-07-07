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
#SBATCH --cpus-per-task=12

# You may not place any commands before the last SBATCH directive

############################
#       Actual work        #
############################

# Design space exploration

# Elementwise Queue
cd /home/nmeseguer/mgpusim/samples/tma/elementwise_queue
go build

# Define the range of values for tilesize_a and queue_tiles
for tilesize in 512 1024 2048 4096 8192 16384 32768 65536
do
    for queue_tiles in 1 2 4 8 16 32
    do
        # Run the command with the current values of tilesize_a and queue_tiles
        ./elementwise_queue -timing -parallel -report-all -metric-file-name="slurm-${tilesize}-${queue_tiles}" -length=1048576 -tilesize=${tilesize} -queue_tiles=${queue_tiles} -globalsize=640 -localsize=640
        ./elementwise_queue -timing -parallel -report-all -metric-file-name="slurm-32cus-${tilesize}-${queue_tiles}" -length=33554432 -tilesize=${tilesize} -queue_tiles=${queue_tiles} -globalsize=20480 -localsize=640
    done
done

# Cartesian Queue
cd /home/nmeseguer/mgpusim/samples/tma/cartesian_queue
go build

# Define the range of values for tilesize_a, tilesize_b, tma_wfs and queue_tiles_b
for tilesize_a in 512 1024 2048 4096 8192
do
    for tilesize_b in 512 1024 2048
    do
        for queue_tiles_b in 1 2 4 
        do
            # Run the command with the current values of tilesize_a, tilesize_b, tma_wfs and queue_tiles_b
            ./cartesian_queue -timing -parallel -report-all -metric-file-name="slurm-${tilesize_a}-${tilesize_b}-${queue_tiles_b}" -length_a=8192 -length_b=2048 -tilesize_a=${tilesize_a} -tilesize_b=${tilesize_b} -tma_wfs=1 -queue_tiles_b=${queue_tiles_b} -globalsize=576 -localsize=576
            ./cartesian_queue -timing -parallel -report-all -metric-file-name="slurm-32cus-${tilesize_a}-${tilesize_b}-${queue_tiles_b}" -length_a=262144 -length_b=65536 -tilesize_a=${tilesize_a} -tilesize_b=${tilesize_b} -tma_wfs=1 -queue_tiles_b=${queue_tiles_b} -globalsize=18432 -localsize=576
        done
    done
done



# Finish the script
exit 0
