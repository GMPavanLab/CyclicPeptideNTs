#!/bin/bash -l
#SBATCH --job-name=5cpL
#SBATCH --time=01:00:00
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --ntasks-per-core=12
#SBATCH --cpus-per-task=2
#SBATCH --partition=normal
#SBATCH --constraint=gpu
#SBATCH --account=s1125
#SBATCH --contiguous
#SBATCH --hint=nomultithread
#SBATCH --output=outlog         # Path for output must already exist
#SBATCH --error=errlog          # Path for errors must already exist

export OMP_NUM_THREADS=$SLURM_CPUS_PER_TASK
module load daint-gpu
module load GROMACS

gmx wham -it tpr-files.dat -if pullf-files.dat -o pmf.xvg -hist histo.xvg -unit kJ

