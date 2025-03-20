#!/bin/bash -l

##############################
#       Job blueprint        #
##############################

# Give your job a name, so you can recognize it in the queue overview
#SBATCH --job-name=tma_dnn_notma
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=4

# You may not place any commands before the last SBATCH directive

############################
#       Actual work        #
############################

cd /home/nmeseguer/mgpusim/samples/tma

# Queue Tester
cd ./dnn_notma

go build

LOCALSIZE=512
CU=64

GLOBALSIZE=$(( $LOCALSIZE * $CU ))

# AlexNet
./dnn_notma -timing -report-all -magic-memory-copy -metric-file-name="${1}-slurm-dnn-alexnet" -globalsize=$GLOBALSIZE -localsize=$LOCALSIZE -gpu-model="$1" -json_file="models/AlexNet.json" &

# MobileBert
./dnn_notma -timing -report-all -magic-memory-copy -metric-file-name="${1}-slurm-dnn-mobilebert" -globalsize=$GLOBALSIZE -localsize=$LOCALSIZE -gpu-model="$1" -json_file="models/MobileBert.json" &

# ResNet50
./dnn_notma -timing -report-all -magic-memory-copy -metric-file-name="${1}-slurm-dnn-resnet50" -globalsize=$GLOBALSIZE -localsize=$LOCALSIZE -gpu-model="$1" -json_file="models/ResNet.json" &

# T5
./dnn_notma -timing -report-all -magic-memory-copy -metric-file-name="${1}-slurm-dnn-t5" -globalsize=$GLOBALSIZE -localsize=$LOCALSIZE -gpu-model="$1" -json_file="models/T5.json" &

# YOLO
./dnn_notma -timing -report-all -magic-memory-copy -metric-file-name="${1}-slurm-dnn-yolo" -globalsize=$GLOBALSIZE -localsize=$LOCALSIZE -gpu-model="$1" -json_file="models/YOLO.json" &

wait

# Finish the script
exit 0
