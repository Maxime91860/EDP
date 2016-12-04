

tab = read.table(file = "trace")
names(tab) = c("#Requete", "Type_accès", "Adresse", "Taille", "Date debut requête")

lecture = subset(tab, Type_accès==0)
ecriture = subset(tab, Type_accès==1)
pourcentage_lecture = (nrow(lecture)/nrow(tab))*100
pourcentage_ecriture = (nrow(ecriture)/nrow(tab))*100

print(pourcentage_ecriture)
print(pourcentage_lecture)


x11()
hist(tab[,4], xlim = c(1,7), ylim = c(0,10000), 
     main = "Histogramme de la répartition des tailles des requêtes",
     labels = TRUE,
     xlab = "Taille de bloc",
     ylab = "Nombre d'occurence",
     col = "plum")
#quantile()
max_taille = max(tab[,4])
min_taille = min(tab[,4])
moyenne_taille = mean(tab[,4])
variance_taille = var(tab[,4])
ecart_type_taille = sd(tab[,4])
coeff_de_variation = ecart_type_taille/moyenne_taille


resultat = c(max_taille, min_taille, moyenne_taille, variance_taille, ecart_type_taille, coeff_de_variation);
names(resultat) = c("Taille Maximale", "Taille Minimale", "Taille moyenne", "Variance de la taille", "Ecart type de la taille","Coefficient de variation");

summary(tab[,4])
summary(lecture[,4])
summary(ecriture[,4])

hist(tab[,5], 
     main = "Histogramme de la répartition des requêtes au cours du temps",
     labels = TRUE,
     xlab = "Temps",
     ylab = "Nombre d'occurence",
     col = "plum")

hist(tab[,3], 
     main = "Histogramme de la répartition des requêtes sur la mémoire",
     labels = TRUE,
     xlab = "Adresse",
     ylab = "Nombre d'occurence",
     col = "darkblue")
