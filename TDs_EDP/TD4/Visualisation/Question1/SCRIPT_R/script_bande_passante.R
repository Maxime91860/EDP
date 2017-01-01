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

debit_executions = list(as.matrix(data1[,"MB/sec"]),
                     as.matrix(data2[,"MB/sec"]),
                     as.matrix(data3[,"MB/sec"]),
                     as.matrix(data4[,"MB/sec"]),
                     as.matrix(data5[,"MB/sec"]))


#-----------------------------#
# ---------Moyenne----------- #
#-----------------------------#
moyennes = seq (1:5)
for(i in 1:5){
  moyennes[i] = mean (tps_reponse_executions[[i]])
}

for(i in 1:length(moyennes)){
  cat (i, moyennes[i], file = "tps_resp_moyen.txt", sep = " ", append=TRUE)
  cat ("\n", file = "tps_resp_moyen.txt", append = TRUE)
}

# names(moyennes) = c("Moyenne tps reponse r1", "Moyenne tps reponse r2", "Moyenne tps reponse r3"
                    # ,"Moyenne tps reponse r4", "Moyenne tps reponse r5")

# plot(seq(1:5),moyennes, type = "h")

#-----------------------------#
# ---------Variance---------- #
#-----------------------------#
variances = seq (1:5)
for(i in 1:5){
  variances[i] = var (tps_reponse_executions[[i]])
}

# names(variances) = c("Variance tps reponse r1", "Variance tps reponse r2", "Variance tps reponse r3"
#                     ,"Variance tps reponse r4", "Variance tps reponse r5")



#-----------------------------#
# --Intervalle de confiance-- #
#-----------------------------#
cat("execution borne_inferieure borne_superieure")
for(i in 1:5){
  borne_inf = moyennes[i] - 1.96 * (sd(tps_reponse_executions[[i]])/sqrt(length(tps_reponse_executions[[i]])))
  borne_sup = moyennes[i] + 1.96 * (sd(tps_reponse_executions[[i]])/sqrt(length(tps_reponse_executions[[i]])))
  cat(i,borne_inf, borne_sup, sep = " ")
  cat("\n")
}



#-----------------------------#
# ---------Quantile---------- #
#-----------------------------#
cat("execution borne_inferieure borne_superieure")
for(i in 1:5){
  quantile = quantile (tps_reponse_executions[[i]])
}


