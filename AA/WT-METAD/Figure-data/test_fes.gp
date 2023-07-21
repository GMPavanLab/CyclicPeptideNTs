reset
set xrange [3.5:12]
set yrange [0:800]
set isosample 1000, 1000
set table 'test.dat'
splot "new_fes_bw1.dat" u 1:2:(($3+1.917421)/4.184) notitle
unset table

set contour base
#set cntrparam level incremental 0, 3, 36
set cntrparam level incremental 0, 3, 18 
unset surface
set table 'cont.dat'
splot "new_fes_bw1.dat" u 1:2:(($3+1.917421)/4.184) notitle
unset table

reset
set cbtics 3 
set xtics 2
set ytics 100 
set grid
set palette maxcolor 6
set xrange [3.5:12]
set yrange [0:800]
set cbrange [0:18]
set xlabel "x"
set ylabel "y"
set cblabel "Free Energy [kcal/mol]"
#unset key
set palette defined (\
		0 '#1F3B73',\
		1 '#2F9294',\
		2 '#50B28D',\
		3 '#A7D655',\
		4 '#FFE03E',\
		5 '#FFA955',\
		6 '#D6573B')
p 'new_fes_bw1.dat' u 1:2:(($3+1.917421)/4.184) with image notitle, 'cont.dat' w l lt -1 lw 1.5 notitle
pause -1 "Hit any key to continue"
