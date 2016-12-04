
all : generation_trace

exemple : 
	./generation_trace 1000
	R CMD BATCH histogramme_memoire.R

	# evince histogramme_memoire.pdf

generation_trace : td2_edp_generation.c
	gcc $< -O3 -g -Wall -o $@

clean : 
	rm -rf traceHspot generation_trace histogramme_memoire.pdf histogramme_memoire.Rout
