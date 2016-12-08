***Maxime Kermarquer M2 CHPS***

**Génération de trace**
===================

Mon rendu du TD2 contient 3 fichiers :
> `histogramme_memoire.R` Scripts R qui réalise l'histogramme.
> `td2_edp_generation.c` Code C qui génère la trace d'accès non-uniforme à la mémoire.
> `Makefile` Le fichier de compilation.

----------

###Pour compiler :
> `make`

----------

###Pour générer la trace :
  L' exécutable a 3 arguments :
    1. La taille du hotspot.
    2. Le nombre de requêtes total.
    3. Le nombre dans le hotspot.
  Les deux derniers arguments modèlisent la densité du hotspot.

```./generation_trace <Taille Hostspot> <Nombre de requêtes total> <Nombre de requêtes dans le hotspot>```

----------
###Pour générer l'histogramme (après avoir générer la trace) :
```make histogramme```
  
(On a besoin de R pour générer l'histogramme, pour l'installer)
> `sudo apt-get install r-base`

----------
###Exemple 
Pour générer l'histogramme avec un hotspot de taille 1000 blocs mémoire, avec 10000 requêtes dont 9000 dans le hotspot.
> `make exemple`

----------
###Suppression des fichiers générés
> `make clean`

*(Voir le makefile, pour plus de détails)*