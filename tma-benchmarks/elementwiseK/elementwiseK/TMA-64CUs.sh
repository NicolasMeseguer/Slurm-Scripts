#!/bin/bash -l

##############################
#       Job blueprint        #
##############################

#SBATCH --job-name=tma_elementwiseK_64cus
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=4

# You may not place any commands before the last SBATCH directive

############################
#       Actual work        #
############################

cd /home/nmeseguer/mgpusim/samples/tma

# Elementwise K - TMA
cd ./elementwiseK

go build

# 512 TileSize
./elementwiseK -timing -report-all -magic-memory-copy -metric-file-name="slurm-64cus-512" -length=16777216 -tilesize=512 -globalsize=36864 -localsize=576 &

# 2048 TileSize
./elementwiseK -timing -report-all -magic-memory-copy -metric-file-name="slurm-64cus-2048" -length=16777216 -tilesize=2048 -globalsize=36864 -localsize=576 &

# 8192 TileSize
./elementwiseK -timing -report-all -magic-memory-copy -metric-file-name="slurm-64cus-8192" -length=16777216 -tilesize=8192 -globalsize=36864 -localsize=576 &

wait

# Finish the script
exit 0
