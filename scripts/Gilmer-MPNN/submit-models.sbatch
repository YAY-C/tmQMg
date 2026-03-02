#!/bin/bash -l
#SBATCH --nodes=1
#SBATCH --gpus-per-node=1
#SBATCH --cpus-per-task=1
#SBATCH --ntasks=1
#SBATCH --mem=4GB
#SBATCH --time=12:00:00
#SBATCH --job-name=NatQG-MPNN
#SBATCH --partition=mig

module purge
conda run -n tmQMg python -c 'import torch; print(torch.cuda.is_available()); print(f"Current device count = {torch.cuda.device_count()}");device=torch.cuda.current_device();print(f"Device name = {torch.cuda.get_device_name(device)}")'

conda run -n tmQMg --live-stream python -u ml.py $@
