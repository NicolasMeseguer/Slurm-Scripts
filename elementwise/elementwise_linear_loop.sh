#!/bin/bash -l

##############################
#       Job blueprint        #
##############################

# Give your job a name, so you can recognize it in the queue overview
#SBATCH --job-name=elementwise_linear_loop

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

cd /home/nmeseguer/mgpusim/samples/elementwise_linear_loop

#go run main.go -timing -metric-file-name="-timing" -length=524288 -localsize=128
#go run main.go -timing -magic-memory-copy -metric-file-name="-timing-mmcopy" -length=524288 -localsize=128
#go run main.go -timing -magic-memory-copy -parallel -metric-file-name="-timing-mmcopy-parallel" -length=524288 -localsize=128

#go run main.go -timing -metric-file-name="524-64" -length=524288 -localsize=64
#go run main.go -timing -metric-file-name="524-128" -length=524288 -localsize=128
#go run main.go -timing -metric-file-name="524-256" -length=524288 -localsize=256
#go run main.go -timing -metric-file-name="524-512" -length=524288 -localsize=512
#go run main.go -timing -metric-file-name="524-1024" -length=524288 -localsize=1024

go run main.go -timing -metric-file-name="test" -length=524288 -localsize=256

# Finish the script
exit 0

