#!/bin/bash -l

##############################
#       Job blueprint        #
##############################

# Give your job a name, so you can recognize it in the queue overview
#SBATCH --job-name=tma_elementwiseK_queue
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=4

# You may not place any commands before the last SBATCH directive

############################
#       Actual work        #
############################

cd /home/nmeseguer/mgpusim/samples/tma

# Queue Tester
cd ./elementwiseK_queue

go build

LOCALSIZE=576
BASE_LENGTH=262144

for CU in 1 2 4 5 8 16 32 64 120; do

  # If the iteration is bigger than 5 and the $1 is 'radeon530', then exit
  if [ $CU -gt 5 ] && [ "$1" == "radeon530" ]; then
    exit 0

  # If the iteration is bigger than 64 and the $1 is 'r9nano', then exit
  elif [ $CU -gt 64 ] && [ "$1" == "r9nano" ]; then
    exit 0
  
  # If the iteration is bigger than 128 and the $1 is 'mi100', then exit
  elif [ $CU -gt 120 ] && [ "$1" == "mi100" ]; then
    exit 0
  fi

  GLOBALSIZE=$(( $LOCALSIZE * $CU ))
  LENGTH=$(( $BASE_LENGTH * $CU ))

  for QUEUETILE in 1 2 4 8; do
    for TILESIZE in 512 1024 2048 4096 8192; do

      ./elementwiseK_queue -timing -report-all -magic-memory-copy -metric-file-name="${1}-slurm-${CU}cu-${QUEUETILE}qt-${TILESIZE}" -length=$LENGTH -tilesize=$TILESIZE -queue_tiles=$QUEUETILE -globalsize=$GLOBALSIZE -localsize=$LOCALSIZE -gpu-model="$1"
      
    done
  done
done

# Create the $1 directory if it does not exist
mkdir $1

# Move the csv files to the $1 directory
mv slurm-* $1

# Finish the script
exit 0
