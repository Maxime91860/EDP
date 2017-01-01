# EDP TP Evalution de performances
# Mesure

data1 = read.table(file = "DATA/r1.txt")
data2 = read.table(file = "DATA/r2.txt")
data3 = read.table(file = "DATA/r3.txt")
data4 = read.table(file = "DATA/r4.txt")

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

tps_reponse_executions = list(as.matrix(data1[,"resp time"]),
                           as.matrix(data2[,"resp time"]),
                           as.matrix(data3[,"resp time"]),
                           as.matrix(data4[,"resp time"]))

bande_passantes_executions = list(as.matrix(data1[,"MB/sec"]),
                              as.matrix(data2[,"MB/sec"]),
                              as.matrix(data3[,"MB/sec"]),
                              as.matrix(data4[,"MB/sec"]))


#-----------------------------#
# ---------Moyenne----------- #
#-----------------------------#

moyennes = seq (1:4)
moyennes_bandes_passante = seq (1:4)
for(i in 1:length(moyennes)){
  moyennes[i] = mean (tps_reponse_executions[[i]])
  moyennes_bandes_passante[i] = mean (bande_passantes_executions[[i]])
}

# names(moyennes) = c("Moyenne tps reponse r1", "Moyenne tps reponse r2", "Moyenne tps reponse r3"
                    # ,"Moyenne tps reponse r4", "Moyenne tps reponse r4")

# plot(seq(1:4),moyennes, type = "h")

#-----------------------------#
# ---------Variance---------- #
#-----------------------------#
variances = seq (1:4)
for(i in 1:4){
  variances[i] = var (tps_reponse_executions[[i]])
}

# names(variances) = c("Variance tps reponse r1", "Variance tps reponse r2", "Variance tps reponse r3"
#                     ,"Variance tps reponse r4", "Variance tps reponse r4")



#-----------------------------#
# --Intervalle de confiance-- #
#-----------------------------#
borne_inf = borne_sup = seq (1:4)
for(i in 1:4){
  borne_inf[i] = moyennes[i] - 1.96 * (sd(tps_reponse_executions[[i]])/sqrt(length(tps_reponse_executions[[i]])))
  borne_sup[i] = moyennes[i] + 1.96 * (sd(tps_reponse_executions[[i]])/sqrt(length(tps_reponse_executions[[i]])))
}



#-----------------------------#
# ---------Quantile---------- #
#-----------------------------#
for(i in 1:4){
  quantile = quantile (tps_reponse_executions[[i]])
}

#-----------------------------#
# --Ecriture des resultats--- #
#-----------------------------#
# cat("execution\tmoyenne\tvariance\tborne_inferieure_int_conf\tborne_superieure_int_conf\n",
    # file = "tps_resp_stats.txt")
for(i in 1:4){
  cat (i, moyennes[i], variances[i], borne_inf[i], borne_sup[i],
       file = "RESULTATS/tps_resp_stats.txt", sep = "\t\t", append=TRUE)
  cat ("\n", file = "RESULTATS/tps_resp_stats.txt", append = TRUE)
  cat (i, moyennes_bandes_passante[i], file = "RESULTATS/bande_pass_stats.txt", append = TRUE)
  cat ("\n", file = "RESULTATS/bande_pass_stats.txt", append = TRUE)
}


#summary(tps_reponse_executions[[1]])
