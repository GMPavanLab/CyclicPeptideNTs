#!/bin/bash
#SBATCH --time=01:00:00
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=8
#SBATCH --mem=2GB
#SBATCH --partition=m100_usr_prod
#SBATCH --job-name=8CP-8CP
#SBATCH --account=IscrB_POLYFUEL
#SBATCH --gres=gpu:4
#SBATCH --output=outlog         # Path for output must already exist
#SBATCH --error=errlog          # Path for errors must already exist

module load profile/chem-phys
module load spectrum_mpi/10.3.1--binary
module load gnu/8.4.0
module load fftw
module load cuda/10.1
module load gromacs/2020.2
export OMP_NUM_THREADS=$SLURM_CPUS_PER_TASK;

gmx wham -it tpr-files.dat -if pullf-files.dat -o pmf_v01.xvg -hist histo_v01.xvg -bsres bres_v01.xvg -bsprof prof_v01.xvg -unit kJ
gmx wham -it tpr-files.dat -if pullf-files.dat -o pmf_v02.xvg -hist histo_v02.xvg -nBootstrap 100 -bsres bsResults.xvg -unit kJ  

