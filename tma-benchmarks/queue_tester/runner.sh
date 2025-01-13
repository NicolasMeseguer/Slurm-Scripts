#!/bin/bash -l

##############################
#       Job blueprint        #
##############################

# Give your job a name, so you can recognize it in the queue overview
#SBATCH --job-name=queue_tester
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1

# You may not place any commands before the last SBATCH directive

############################
#       Actual work        #
############################

# 1. Before executing, clear the ./json folder (if it exists)
rm -rf /home/nmeseguer/Slurm-Scripts/tma-benchmarks/queue_tester/json

# 2. Make the directory
mkdir /home/nmeseguer/Slurm-Scripts/tma-benchmarks/queue_tester/json

cd /home/nmeseguer/mgpusim/samples/tma

# Queue Tester
cd ./queue_configurator_tester

go build

OUT_PATH="/home/nmeseguer/Slurm-Scripts/tma-benchmarks/queue_tester/json"

LOCALSIZE=576
DIM_K=2048
TMA_WFS=1
TYPE_SIZE=4

for CU in 1 2 16 32 64; do
  GLOBALSIZE=$(( 576 * CU ))

    for VECTORTYPE in "0" "1" "0,0" "1,0" "0,1" "1,1"; do

        for AI in 0 1 2; do

            ./queue_configurator_tester -globalsize=$GLOBALSIZE -localsize=$LOCALSIZE -tma_wfs=$TMA_WFS -dim_k=$DIM_K -arithmetic_intensity=$AI -vector_type=$VECTORTYPE -type_size=$TYPE_SIZE -output_path=$OUT_PATH
        
        done
    done
done

# Finish the script
exit 0
