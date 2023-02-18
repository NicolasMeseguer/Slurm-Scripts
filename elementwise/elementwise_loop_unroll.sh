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
cd /home/nmeseguer/mgpusim-dev/samples/elementwise_loop_unrolling

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

# You will find a file called slurm-1234.out in the submit directory.
# This file will contain all output that was produced during runtime, 
# i.e. stdout and stderr.

# Finish the script
exit 0