# EDP TP Evalution de performances
# Mesure

data1 = read.table(file = "DATA/r1.txt")
data2 = read.table(file = "DATA/r2.txt")
data3 = read.table(file = "DATA/r3.txt")
data4 = read.table(file = "DATA/r4.txt")
data5 = read.table(file = "DATA/r5.txt")

noms_variables = c( "dec. 16, 2016",
                    "interval",
                    "i/o rate",
                    "MB/sec",
                    "bytes i/o",
                    "read pct",
                    "resp time",
                    "read resp",
                    "write resp",
                    "resp max",
                    "resp stddev",
                    "queue depth",
                    "cpu%sys+u",
                    "cpu%sys")
names(data1) = noms_variables
names(data2) = noms_variables
names(data3) = noms_variables
names(data4) = noms_variables
names(data5) = noms_variables

tps_reponse_executions = list(as.matrix(data1[,"resp time"]),
                           as.matrix(data2[,"resp time"]),
                           as.matrix(data3[,"resp time"]),
                           as.matrix(data4[,"resp time"]),
                           as.matrix(data5[,"resp time"]))

bande_passantes_executions = list(as.matrix(data1[,"MB/sec"]),
                              as.matrix(data2[,"MB/sec"]),
                              as.matrix(data3[,"MB/sec"]),
                              as.matrix(data4[,"MB/sec"]),
                              as.matrix(data5[,"MB/sec"]))


#-----------------------------#
# ---------Moyenne----------- #
#-----------------------------#

moyennes = seq (1:5)
moyennes_bandes_passante = seq (1:5)
for(i in 1:length(moyennes)){
  moyennes[i] = mean (tps_reponse_executions[[i]])
  moyennes_bandes_passante[i] = mean (bande_passantes_executions[[i]])
}


#-----------------------------#
# ---------Variance---------- #
#-----------------------------#
variances = seq (1:5)
for(i in 1:5){
  variances[i] = var (tps_reponse_executions[[i]])
}


#-----------------------------#
# --Intervalle de confiance-- #
#-----------------------------#
borne_inf = borne_sup = seq (1:5)
for(i in 1:5){
  ecart = 1.96 * (sd(tps_reponse_executions[[i]])/sqrt(length(tps_reponse_executions[[i]])))
  borne_inf[i] = moyennes[i] - ecart
  borne_sup[i] = moyennes[i] + ecart
}



#-----------------------------#
# ---------Quantile---------- #
#-----------------------------#
for(i in 1:5){
  quantile = quantile (tps_reponse_executions[[i]])
  cat (i, quantile[[2]], quantile[[3]], quantile[[4]],
       file = "RESULTATS/tps_resp_quantiles.txt", sep = "\t\t", append=TRUE)
  cat ("\n", file = "RESULTATS/tps_resp_quantiles.txt", append = TRUE)
}

#-----------------------------#
# --Ecriture des resultats--- #
#-----------------------------#
for(i in 1:5){
  cat (i, moyennes[i], variances[i], borne_inf[i], borne_sup[i],
       file = "RESULTATS/tps_resp_stats.txt", sep = "\t\t", append=TRUE)
  cat ("\n", file = "RESULTATS/tps_resp_stats.txt", append = TRUE)
  cat (i, moyennes_bandes_passante[i], file = "RESULTATS/bande_pass_stats.txt", append = TRUE)
  cat ("\n", file = "RESULTATS/bande_pass_stats.txt", append = TRUE)
}
