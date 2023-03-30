#!/bin/bash -l

##############################
#       Job blueprint        #
##############################

# Give your job a name, so you can recognize it in the queue overview
#SBATCH --job-name=streamemory_splitted

# Define, how many nodes you need. Here, we ask for 1 node since we have a single-node machine.
#SBATCH --nodes=1
# We want to launch 1 task.
#SBATCH --ntasks=1
# We want to use all the cores of the node.
#SBATCH --cpus-per-task=12

# You may not place any commands before the last SBATCH directive

############################
#       Actual work        #
############################

INPUT=metrics.csv
IFS=','

cd /home/nmeseguer/mgpusim/samples/stream

cd elementwise_stride
go run main.go -timing -parallel
sleep 20
[ ! -f $INPUT ] && { echo "Metrics not found!";}
while read id where what value
do
    echo "$value"
done < <(tail -n +4 $INPUT)

cd ../elementwise
go run main.go -timing -parallel
sleep 20
[ ! -f $INPUT ] && { echo "Metrics not found!";}
while read id where what value
do
    echo "$value"
done < <(tail -n +4 $INPUT)

cd ../elementwise_copy_stride
go run main.go -timing -parallel
sleep 20
[ ! -f $INPUT ] && { echo "Metrics not found!";}
while read id where what value
do
    echo "$value"
done < <(tail -n +4 $INPUT)

cd ../elementwise_copy
go run main.go -timing -parallel
sleep 20
[ ! -f $INPUT ] && { echo "Metrics not found!";}
while read id where what value
do
    echo "$value"
done < <(tail -n +4 $INPUT)

cd ../copy
go run main.go -timing -parallel
sleep 20
[ ! -f $INPUT ] && { echo "Metrics not found!";}
while read id where what value
do
    echo "$value"
done < <(tail -n +4 $INPUT)

cd ../scale
go run main.go -timing -parallel
sleep 20
[ ! -f $INPUT ] && { echo "Metrics not found!";}
while read id where what value
do
    echo "$value"
done < <(tail -n +4 $INPUT)

cd ../add
go run main.go -timing -parallel
sleep 20
[ ! -f $INPUT ] && { echo "Metrics not found!";}
while read id where what value
do
    echo "$value"
done < <(tail -n +4 $INPUT)

cd ../triad
go run main.go -timing -parallel
sleep 20
[ ! -f $INPUT ] && { echo "Metrics not found!";}
while read id where what value
do
    echo "$value"
done < <(tail -n +4 $INPUT)

# Finish the script
exit 0
