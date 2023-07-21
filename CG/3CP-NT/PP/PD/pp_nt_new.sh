# @ shell=/bin/bash
gmx make_ndx -f INPUT/conf_nt.gro -o INPUT/index.ndx < INPUT/nt.txt
gmx make_ndx -f INPUT/conf_nt.gro -o INPUT/index_vect.ndx < INPUT/input_index_vect.txt
mkdir ncont nvect

for c in {1..14}
do
nt=$c
ntt=$(bc <<< "${c}+1")

cd ncont
while [ ${ntt} -le 14 ]
do
gmx mindist -f ../../../MD_v01/14nt_md.xtc -s ../INPUT/input_nt.tpr -n ../INPUT/index.ndx -e 10000000 -on nt${nt}-nt${ntt}.xvg -group << EOF
TRP${nt}
TRP${ntt}
EOF
ntt=$((ntt+1))
done
rm *#

cd ../nvect
ntt=$(bc <<< "${c}+1")
while [ ${ntt} -le 14 ]
do
gmx gangle -f ../../../MD_v01/14nt_md.xtc -s ../INPUT/input_nt.tpr -n ../INPUT/index_vect.ndx -e 10000000 -g1 vector -group1 'com of group 'cp${nt}1' plus com of group 'cp${nt}2'' -g2 vector -group2 'com of group 'cp${ntt}1' plus com of group 'cp${ntt}2'' -oav vect_nt${nt}-nt${ntt}.xvg -oh histo_nt${nt}-nt${ntt}.xvg
ntt=$((ntt+1))
done
rm *#
cd ..
done
