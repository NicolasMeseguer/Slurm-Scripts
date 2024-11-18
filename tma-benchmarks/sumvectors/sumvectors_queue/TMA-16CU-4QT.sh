#!/bin/bash -l

##############################
#       Job blueprint        #
##############################

#SBATCH --job-name=tma_sumvectors_queue_16cus_4qt
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=2

# You may not place any commands before the last SBATCH directive

############################
#       Actual work        #
############################

cd /home/nmeseguer/mgpusim/samples/tma

# sumvectors - Queue
cd ./sumvectors_queue

go build

# 512 TileSize
./sumvectors_queue -timing -report-all -magic-memory-copy -metric-file-name="slurm-16cus-4qt-512" -length=4194304 -tilesize=512 -queue_tiles=4 -globalsize=10240 -localsize=640 &

wait

# Finish the script
exit 0
