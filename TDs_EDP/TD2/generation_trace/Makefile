
all : generation_trace

exemple : generation_trace
	./generation_trace 1000 10000 9000
	R CMD BATCH histogramme_memoire.R
	evince histogramme_memoire.pdf

generation_trace : td2_edp_generation.c
	gcc $< -O3 -g -Wall -o $@

histogramme : histogramme_memoire.pdf
	evince $^

histogramme_memoire.pdf : histogramme_memoire.R traceHspot
	R CMD BATCH $<

traceHspot : generation_trace
	./$< 1000 10000 9000

clean : 
	rm -rf traceHspot generation_trace histogramme_memoire.pdf histogramme_memoire.Rout
