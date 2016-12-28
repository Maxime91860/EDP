
all : script1gnuplot.pdf script2gnuplot.pdf histogramme.pdf test.pdf

%.pdf : %.gplot
	gnuplot $<

visu : 
	evince PLOT/*.pdf

test :
	gnuplot histogramme.gplot
	evince tps_resp_hist.pdf

clean_tps_reponse : 
	rm -rf tps_resp_moyen.txt tps_resp_variance.txt tps_resp_conf_int.txt tps_resp_quantile.txt

clean :
	rm -rf *.pdf