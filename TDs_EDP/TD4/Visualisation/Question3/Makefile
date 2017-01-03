
all : SCRIPT_GNUPLOT/tps_resp_moyen.pdf SCRIPT_GNUPLOT/bande_passante_moyenne.pdf

%.pdf : %.gplot
	gnuplot $<

visu : 
	evince PLOT/*

stats :
	R CMD BATCH SCRIPT_R/script_stats.R
	rm -rf script_stats.Rout

clean_stats : 
	rm -rf RESULTATS/* 

clean :
	rm -rf PLOT/*