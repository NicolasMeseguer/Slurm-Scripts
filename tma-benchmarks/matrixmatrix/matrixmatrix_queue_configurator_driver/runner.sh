#!/bin/bash -l

##############################
#       Job blueprint        #
##############################

# Give your job a name, so you can recognize it in the queue overview
#SBATCH --job-name=tma_matrixmatrix_queue_configurator_driver
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=4

# You may not place any commands before the last SBATCH directive

############################
#       Actual work        #
############################

cd /home/nmeseguer/mgpusim/samples/tma

# Queue Tester
cd ./matrixmatrix_queue_configurator_driver

go build

LOCALSIZE=576
DIM_M=512
DIM_K=2048
DIM_N=128

for CU in 1 2 4 5 8 16 32 64 128; do

  # If the iteration is bigger than 5 and the $1 is 'radeon530', then exit
  if [ $CU -gt 5 ] && [ "$1" == "radeon530" ]; then
    exit 0

  # If the iteration is bigger than 64 and the $1 is 'r9nano', then exit
  elif [ $CU -gt 64 ] && [ "$1" == "r9nano" ]; then
    exit 0
  
  # If the iteration is bigger than 128 and the $1 is 'mi100', then exit
  elif [ $CU -gt 128 ] && [ "$1" == "mi100" ]; then
    exit 0
  fi

  GLOBALSIZE=$(( $LOCALSIZE * $CU ))

  ./matrixmatrix_queue_configurator_driver -timing -report-all -magic-memory-copy -metric-file-name="slurm-${CU}cu" -dim_m=$DIM_M -dim_k=$DIM_K -dim_n=$DIM_N -globalsize=$GLOBALSIZE -localsize=$LOCALSIZE -gpu-model="$1"
done

# Create the $1 directory if it does not exist
mkdir -p $1

# Move the csv files to the $1 directory
mv slurm-* $1

# Finish the script
exit 0
