#!/bin/bash -l

##############################
#       Job blueprint        #
##############################

# Give your job a name, so you can recognize it in the queue overview
#SBATCH --job-name=elementwise_loop

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

cd /home/nmeseguer/mgpusim-dev/samples/elementwise_loop

go run main.go -timing -magic-memory-copy -parallel -metric-file-name="test1" -length=1024
go run main.go -timing -magic-memory-copy -parallel -metric-file-name="test2" -length=2048
go run main.go -timing -magic-memory-copy -parallel -metric-file-name="test3" -length=4096
go run main.go -timing -magic-memory-copy -parallel -metric-file-name="test4" -length=8192
go run main.go -timing -magic-memory-copy -parallel -metric-file-name="test5" -length=16384
go run main.go -timing -magic-memory-copy -parallel -metric-file-name="test6" -length=32768
go run main.go -timing -magic-memory-copy -parallel -metric-file-name="test7" -length=65536
go run main.go -timing -magic-memory-copy -parallel -metric-file-name="test8" -length=131072
go run main.go -timing -magic-memory-copy -parallel -metric-file-name="test9" -length=262144
go run main.go -timing -magic-memory-copy -parallel -metric-file-name="test10" -length=524288
go run main.go -timing -magic-memory-copy -parallel -metric-file-name="test11" -length=1048576
go run main.go -timing -magic-memory-copy -parallel -metric-file-name="test12" -length=2097152
go run main.go -timing -magic-memory-copy -parallel -metric-file-name="test13" -length=4194304
go run main.go -timing -magic-memory-copy -parallel -metric-file-name="test14" -length=8388608
go run main.go -timing -magic-memory-copy -parallel -metric-file-name="test15" -length=16777216

# Finish the script
exit 0
