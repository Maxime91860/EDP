
all : SCRIPT_GNUPLOT/tps_resp_moyen.pdf SCRIPT_GNUPLOT/bande_passante_moyenne.pdf

%.pdf : %.gplot
	gnuplot $<

visu : 
	evince PLOT/*.pdf

test :
	gnuplot histogramme.gplot
	evince tps_resp_hist.pdf

stats :
	R CMD BATCH SCRIPT_R/script_tps_reponse.R
	rm -rf script_tps_reponse.Rout

clean_stats : 
	rm -rf RESULTATS/* 

clean :
	rm -rf PLOT/*.pdf