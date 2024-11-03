#!/bin/bash -l

##############################
#       Job blueprint        #
##############################

#SBATCH --job-name=tma_elementwiseK_notma_2cus
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=8

############################
#       Actual work        #
############################

cd /home/nmeseguer/mgpusim/samples/tma

# Elementwise K - No TMA
cd ./elementwiseK_notma

go build

# 512 TileSize
./elementwiseK_notma -timing -report-all -magic-memory-copy -metric-file-name="slurm-2cus-512" -length=524288 -tilesize=512 -globalsize=1024 -localsize=512 &

# 1024 TileSize
./elementwiseK_notma -timing -report-all -magic-memory-copy -metric-file-name="slurm-2cus-1024" -length=524288 -tilesize=1024 -globalsize=1024 -localsize=512 &

# 2048 TileSize
./elementwiseK_notma -timing -report-all -magic-memory-copy -metric-file-name="slurm-2cus-2048" -length=524288 -tilesize=2048 -globalsize=1024 -localsize=512 &

# 4096 TileSize
./elementwiseK_notma -timing -report-all -magic-memory-copy -metric-file-name="slurm-2cus-4096" -length=524288 -tilesize=4096 -globalsize=1024 -localsize=512 &

# 8192 TileSize
./elementwiseK_notma -timing -report-all -magic-memory-copy -metric-file-name="slurm-2cus-8192" -length=524288 -tilesize=8192 -globalsize=1024 -localsize=512 &

wait

# Finish the script
exit 0
