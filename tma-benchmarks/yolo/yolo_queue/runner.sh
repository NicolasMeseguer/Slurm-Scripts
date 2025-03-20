#!/bin/bash -l

##############################
#       Job blueprint        #
##############################

# Give your job a name, so you can recognize it in the queue overview
#SBATCH --job-name=tma_yolo_queue
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=8

# You may not place any commands before the last SBATCH directive

############################
#       Actual work        #
############################

cd /home/nmeseguer/mgpusim/samples/tma

# Queue Tester
cd ./yolo_queue

go build

LOCALSIZE=576
CU=64

GLOBALSIZE=$(( $LOCALSIZE * $CU ))

./yolo_queue -timing -report-all -magic-memory-copy -metric-file-name="${1}-slurm-yolo" -globalsize=$GLOBALSIZE -localsize=$LOCALSIZE -gpu-model="$1"

# Finish the script
exit 0
