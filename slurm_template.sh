#!/bin/bash -l

##############################
#       Job blueprint        #
##############################

# Give your job a name, so you can recognize it in the queue overview
#SBATCH --job-name=your_jobname

# Define, how many nodes you need. Here, we ask for 1 node since we have a single-node machine.
#SBATCH --nodes=1
# We want to launch 1 task.
#SBATCH --ntasks=1
# We want to use all the cores of the node.
#SBATCH --cpus-per-task=2

# You may not place any commands before the last SBATCH directive

############################
#       Actual work        #
############################

ls -la
time sleep 90
echo "here you can write commands :)"

# You will find a file called slurm-1234.out in the submit directory.
# This file will contain all output that was produced during runtime, 
# i.e. stdout and stderr.

# Finish the script
exit 0