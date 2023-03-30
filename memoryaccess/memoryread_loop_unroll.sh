#!/bin/bash -l

##############################
#       Job blueprint        #
##############################

# Give your job a name, so you can recognize it in the queue overview
#SBATCH --job-name=memoryread_loop_unroll

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

cd /home/nmeseguer/mgpusim-dev/samples/memoryread_loop_unrolling

go run main.go -timing -magic-memory-copy -parallel -metric-file-name="2-test1" -length=4194304 -unroll=2
go run main.go -timing -magic-memory-copy -parallel -metric-file-name="2-test2" -length=8388608 -unroll=2
go run main.go -timing -magic-memory-copy -parallel -metric-file-name="2-test3" -length=16777216 -unroll=2

go run main.go -timing -magic-memory-copy -parallel -metric-file-name="4-test1" -length=4194304 -unroll=4
go run main.go -timing -magic-memory-copy -parallel -metric-file-name="4-test2" -length=8388608 -unroll=4
go run main.go -timing -magic-memory-copy -parallel -metric-file-name="4-test3" -length=16777216 -unroll=4

go run main.go -timing -magic-memory-copy -parallel -metric-file-name="8-test1" -length=4194304 -unroll=8
go run main.go -timing -magic-memory-copy -parallel -metric-file-name="8-test2" -length=8388608 -unroll=8
go run main.go -timing -magic-memory-copy -parallel -metric-file-name="8-test3" -length=16777216 -unroll=8

go run main.go -timing -magic-memory-copy -parallel -metric-file-name="16-test1" -length=4194304 -unroll=16
go run main.go -timing -magic-memory-copy -parallel -metric-file-name="16-test2" -length=8388608 -unroll=16
go run main.go -timing -magic-memory-copy -parallel -metric-file-name="16-test3" -length=16777216 -unroll=16

# Finish the script
exit 0
