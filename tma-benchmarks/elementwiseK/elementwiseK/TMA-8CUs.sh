#!/bin/bash -l

##############################
#       Job blueprint        #
##############################

#SBATCH --job-name=tma_elementwiseK_8cus
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=8

# You may not place any commands before the last SBATCH directive

############################
#       Actual work        #
############################

cd /home/nmeseguer/mgpusim/samples/tma

# Elementwise K - TMA
cd ./elementwiseK

go build

# 512 TileSize
./elementwiseK -timing -report-all -magic-memory-copy -metric-file-name="slurm-8cus-512" -length=2097152 -tilesize=512 -globalsize=4608 -localsize=576 &

# 1024 TileSize
./elementwiseK -timing -report-all -magic-memory-copy -metric-file-name="slurm-8cus-1024" -length=2097152 -tilesize=1024 -globalsize=4608 -localsize=576 &

# 2048 TileSize
./elementwiseK -timing -report-all -magic-memory-copy -metric-file-name="slurm-8cus-2048" -length=2097152 -tilesize=2048 -globalsize=4608 -localsize=576 &

# 4096 TileSize
./elementwiseK -timing -report-all -magic-memory-copy -metric-file-name="slurm-8cus-4096" -length=2097152 -tilesize=4096 -globalsize=4608 -localsize=576 &

# 8192 TileSize
./elementwiseK -timing -report-all -magic-memory-copy -metric-file-name="slurm-8cus-8192" -length=2097152 -tilesize=8192 -globalsize=4608 -localsize=576 &

wait

# Finish the script
exit 0
