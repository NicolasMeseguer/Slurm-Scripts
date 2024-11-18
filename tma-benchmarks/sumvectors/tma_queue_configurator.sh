#!/bin/bash -l

# TMA Sumvectors Queue Configurator

cd ./sumvectors_queue_configurator

sbatch TMA-1CU.sh
sbatch TMA-16CUs.sh
sbatch TMA-32CUs.sh
sbatch TMA-64CUs.sh


# Finish the script
exit 0
