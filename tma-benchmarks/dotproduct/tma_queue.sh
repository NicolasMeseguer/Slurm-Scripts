#!/bin/bash -l

# TMA dotproduct Queue

cd ./dotproduct_queue

# The first parameter is the name of the model
MODEL_NAME=$1

# If the name of the model is not 'r9nano' or 'mi100', then exit
if [ "$MODEL_NAME" != "r9nano" ] && [ "$MODEL_NAME" != "mi100" ] && [ "$MODEL_NAME" != "radeon530" ]; then

    echo "Invalid model name"
    exit 1
fi

sbatch TMA-1CU-1QT.sh $MODEL_NAME
sbatch TMA-1CU-2QT.sh $MODEL_NAME
sbatch TMA-1CU-4QT.sh $MODEL_NAME
sbatch TMA-1CU-8QT.sh $MODEL_NAME

# We can already skip 2CUs to 8CUs
# sbatch TMA-2CU-1QT.sh $MODEL_NAME
# sbatch TMA-2CU-2QT.sh $MODEL_NAME
# sbatch TMA-2CU-4QT.sh $MODEL_NAME
# sbatch TMA-4CU-1QT.sh $MODEL_NAME
# sbatch TMA-4CU-2QT.sh $MODEL_NAME
# sbatch TMA-4CU-4QT.sh $MODEL_NAME
# sbatch TMA-8CU-1QT.sh $MODEL_NAME
# sbatch TMA-8CU-2QT.sh $MODEL_NAME
# sbatch TMA-8CU-4QT.sh $MODEL_NAME

sbatch TMA-16CU-1QT.sh $MODEL_NAME
sbatch TMA-16CU-2QT.sh $MODEL_NAME
sbatch TMA-32CU-1QT.sh $MODEL_NAME
sbatch TMA-32CU-2QT.sh $MODEL_NAME
sbatch TMA-64CU-1QT.sh $MODEL_NAME
sbatch TMA-64CU-2QT.sh $MODEL_NAME

# Finish the script
exit 0
