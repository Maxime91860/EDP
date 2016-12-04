
trace_hotsport = read.table(file = "traceHspot");
names(trace_hotsport) = c("#Requete", "Adresse");

pdf("histogramme_memoire.pdf");

hist(trace_hotsport[,2], 
     main = "Histogramme de la répartition des requêtes sur la mémoire",
     labels = TRUE,
     xlab = "Espace d'adressage",
     ylab = "Nombre d'occurences",
     col = "darkblue");

dev.off()