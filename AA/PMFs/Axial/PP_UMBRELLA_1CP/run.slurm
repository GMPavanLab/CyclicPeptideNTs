#!/bin/bash -l
#SBATCH --job-name=SCPT2
#SBATCH --time=23:00:00
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=12
#SBATCH --ntasks-per-core=1
#SBATCH --cpus-per-task=2
#SBATCH --partition=normal
#SBATCH --constraint=gpu
#SBATCH --contiguous
#SBATCH --hint=nomultithread
#SBATCH --output=outlog         # Path for output must already exist
#SBATCH --error=errlog          # Path for errors must already exist


export OMP_NUM_THREADS=$SLURM_CPUS_PER_TASK
export MODULEPATH=/users/lpesce/easybuild/daint/haswell/modules/all:$MODULEPATH
module load daint-gpu EasyBuild-custom gcc
module load GROMACS/2018.6-CrayGNU-19.10-PLUMEDv-2.5.1-cuda-10.1


#gmx  grompp -f md.mdp -c ../NPT/2CP_npt.gro -t ../NPT/2CP_npt.cpt -r ../NPT/2CP_npt.gro -p ../TOP/topol.top -o input_md.tpr -n ../TOP/index.ndx
#srun gmx_mpi mdrun -ntomp ${OMP_NUM_THREADS}  -gpu_id 0  -s input_md.tpr -deffnm 2CP_md -v

gmx wham -it tpr-files.dat -if pullf-files.dat -o pmf.xvg  -hist histo.xvg  -unit kJ 
