#@ shell=/bin/bash
gmx editconf -f ../../NPT/7nt_npt.gro -n ../../TOP/index.ndx -o conf_nt.gro < INPUT/input_conf.txt
gmx grompp -f md.mdp -c conf_nt.gro -p TOP/system.top -o input_nt.tpr
gmx make_ndx -f conf_nt.gro -o index_nt.ndx < INPUT/input_ndx.txt
gmx clustsize -f ../../MD/7nt_md.xtc -s input_nt.tpr -cut 0.60 -n index_nt.ndx -e 8000000 < INPUT/input_nc.txt  

