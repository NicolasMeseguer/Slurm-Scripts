# Slurm-Scripts #
Contains all the cookbook recipes for SLURM Workload Manager

Most of this scripts are related with MGPUSim benchmarks, you can see MGPUSim [here](https://gitlab.com/akita/mgpusim).

## Howto ##
1. Copy the template and modify the script to your preferences (```slurm_template.sh```).
2. Run it with ```sbatch slurm_template.sh```
3. A ```.out``` file will be stored in the same folder from which the script was launched.
4. If used with MGPUSim (-report-all), you will find the metrics.csv output in the frontend of the benchmark (i.e. samples/elementwise/).

You can use ```squeue -l``` to see your launched jobs, and ```scancel job_ID``` to cancel your submitted job.

## Advanced commands ##
- ```sinfo``` shows the status of the partitions.
    -  ```sinfo -l``` larger output with more info.
- ```scancel -u username``` to cancel a user's submitted jobs.
- ```scontrol show job job_ID``` info about the submitted job (node, CPU, tasks, partition, etc).
- ```scontrol show nodes``` info about the nodes that are currently active.
- ```scontrol show partitions``` info about the partitions in a larger way.
