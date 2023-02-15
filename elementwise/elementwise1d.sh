#!/bin/bash -l

##############################
#       Job blueprint        #
##############################

# Give your job a name, so you can recognize it in the queue overview
#SBATCH --job-name=memoryread_benchmark

# Define, how many nodes you need. Here, we ask for 1 node since we have a single-node machine.
#SBATCH --nodes=1
# You can further define the number of tasks with --ntasks-per-*
# See "man sbatch" for details. e.g. --ntasks=4 will ask for 4 cpus.

# Define, how long the job will run in real time. This is a hard cap meaning
# that if the job runs longer than what is written here, it will be
# force-stopped by the server. If you make the expected time too long, it will
# take longer for the job to start. Here, we say the job will take 80 minutes.
#              d-hh:mm:ss
#SBATCH --time=0-03:00:00

# Define the partition on which the job shall run. May be omitted.
#SBATCH --partition LocalQ

# How much memory you need.
# --mem will define memory per node and
# --mem-per-cpu will define memory per CPU/core. Choose one of those.
##SBATCH --mem-per-cpu=1500MB
#SBATCH --mem=31GB

# You may not place any commands before the last SBATCH directive

# This is where the actual work is done. In this case, the script only waits.
# The time command is optional, but it may give you a hint on how long the
# command worked
cd /home/nmeseguer/mgpusim-dev/samples/elementwise1d

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
go run main.go -timing -magic-memory-copy -parallel -metric-file-name="test16" -length=33554432
go run main.go -timing -magic-memory-copy -parallel -metric-file-name="test17" -length=67108864

# You will find a file called slurm-1234.out in the submit directory.
# This file will contain all output that was produced during runtime, 
# i.e. stdout and stderr.

# Finish the script
exit 0

