#!/bin/bash -l

##############################
#       Job blueprint        #
##############################

#SBATCH --job-name=tma_elementwiseK_notma_32cus
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=4

# You may not place any commands before the last SBATCH directive

############################
#       Actual work        #
############################

cd /home/nmeseguer/mgpusim/samples/tma

# Elementwise K - No TMA
cd ./elementwiseK_notma

go build

# 512 TileSize
./elementwiseK_notma -timing -report-all -magic-memory-copy -metric-file-name="slurm-32cus-512" -length=8388608 -tilesize=512 -globalsize=16384 -localsize=512 &

# 2048 TileSize
./elementwiseK_notma -timing -report-all -magic-memory-copy -metric-file-name="slurm-32cus-2048" -length=8388608 -tilesize=2048 -globalsize=16384 -localsize=512 &

# 8192 TileSize
./elementwiseK_notma -timing -report-all -magic-memory-copy -metric-file-name="slurm-32cus-8192" -length=8388608 -tilesize=8192 -globalsize=16384 -localsize=512 &

wait

# Finish the script
exit 0
