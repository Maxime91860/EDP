# EDP TP Evalution de performances
# Mesure

data1 = read.table(file = "r1.txt")
data2 = read.table(file = "r2.txt")
data3 = read.table(file = "r3.txt")
data4 = read.table(file = "r4.txt")
data5 = read.table(file = "r5.txt")

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


#-----------------------------#
# ---------Moyenne----------- #
#-----------------------------#


cat ("execution\tmoyenne_tps_reponse\n", file = "tps_resp_moyen.txt")
moyennes = seq (1:5)
for(i in 1:length(moyennes)){
  moyennes[i] = mean (tps_reponse_executions[[i]])
  cat (i, moyennes[i], file = "tps_resp_moyen.txt", sep = "\t", append=TRUE)
  cat ("\n", file = "tps_resp_moyen.txt", append = TRUE)
}

# names(moyennes) = c("Moyenne tps reponse r1", "Moyenne tps reponse r2", "Moyenne tps reponse r3"
                    # ,"Moyenne tps reponse r4", "Moyenne tps reponse r5")

# plot(seq(1:5),moyennes, type = "h")

#-----------------------------#
# ---------Variance---------- #
#-----------------------------#
variances = seq (1:5)
cat ("execution\tvariance_tps_reponse\n", file = "tps_resp_variance.txt")
for(i in 1:5){
  variances[i] = var (tps_reponse_executions[[i]])
  cat (i, variances[i], file = "tps_resp_variance.txt", sep = "\t", append=TRUE)
  cat ("\n", file = "tps_resp_variance.txt", append = TRUE)
}

# names(variances) = c("Variance tps reponse r1", "Variance tps reponse r2", "Variance tps reponse r3"
#                     ,"Variance tps reponse r4", "Variance tps reponse r5")



#-----------------------------#
# --Intervalle de confiance-- #
#-----------------------------#
cat("execution\tborne_inferieure\tborne_superieure\n", file = "tps_resp_conf_int.txt")
for(i in 1:5){
  borne_inf = moyennes[i] - 1.96 * (sd(tps_reponse_executions[[i]])/sqrt(length(tps_reponse_executions[[i]])))
  borne_sup = moyennes[i] + 1.96 * (sd(tps_reponse_executions[[i]])/sqrt(length(tps_reponse_executions[[i]])))
  cat(i,borne_inf, borne_sup, sep = "\t", file = "tps_resp_conf_int.txt",append=TRUE)
  cat("\n", file = "tps_resp_conf_int.txt",append=TRUE)
}



#-----------------------------#
# ---------Quantile---------- #
#-----------------------------#
cat("execution\tquantile\n", file = "tps_resp_quantile.txt")
for(i in 1:5){
  quantile = quantile (tps_reponse_executions[[i]])
  cat(i, quantile, sep = "\n", file = "tps_resp_quantile.txt",append=TRUE)
  cat("\n", file = "tps_resp_quantile.txt",append=TRUE)
}


#summary(tps_reponse_executions[[1]])
