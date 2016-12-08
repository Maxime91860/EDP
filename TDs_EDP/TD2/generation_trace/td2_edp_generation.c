

// --- TD2 : Evaluation de performances ---
//	Génération de workload avec hotspot
//	 MAXIME KERMARQUER - M2 CHPS


#include <stdlib.h>
#include <stdio.h>
#include <unistd.h>

#define TAILLE_ESPACE_ADRESSAGE 144000000000 //Espace de 144 giga-octets
#define TAILLE_BLOC_MEMOIRE 4000 //Bloc de 4 kilo-octets
#define NOM_FICHIER "traceHspot"

int main (int argc, char** argv){

	if(argc < 3){
		fprintf(stderr, "Erreur arguments : \nUsage : %s <Taille Hostspot> <Nombre de requêtes total> <Nombre de requêtes dans le hotspot>\n",argv[0]);
		fprintf(stderr, "\tExemple: %s 1000 10000 9000\n",argv[0]);
		fprintf(stderr, "\tPour un hotspot de 1000 adresses, on va générer 9000 adresses dedans.\n");
		exit(-1);
	}

	int taille_hotspot;
	int debut_hotspot;
	int fin_hotspot;
	int adresse_requete;
	int requetes_acceptees;
	int adresse_max;
	int i;
	int nb_requetes_total;
	int nb_requetes_hotspot;
	FILE* fichier_sortie;

	adresse_max = TAILLE_ESPACE_ADRESSAGE / TAILLE_BLOC_MEMOIRE;
	taille_hotspot = atoi(argv[1]);
	if(taille_hotspot >=  adresse_max){
		fprintf(stderr, "Taille de Hotspot trop grande.\n");
		exit(-1);
	}

	//Placement Hotspot
	srand(taille_hotspot);
	debut_hotspot = rand()%adresse_max;
	fin_hotspot = debut_hotspot + taille_hotspot;

	//Densité Hotspot
	nb_requetes_total = atoi(argv[2]);
	nb_requetes_hotspot = atoi(argv[3]);
	if(nb_requetes_total < nb_requetes_hotspot){
		fprintf(stderr, "Nombre de requêtes dans le hotspot supérieur au nombre de requête total.\n");
		exit(-1);
	}

	int adresses_generees[nb_requetes_total]; //On a nb_requetes_total adresses à générer 



	printf("Hotspot de : @%d à @%d\n",debut_hotspot, fin_hotspot);
	printf("Adresse max %d\n",adresse_max);

	//Génération des adresses hors hotspot
	requetes_acceptees = 0;
	while (requetes_acceptees != (nb_requetes_total-nb_requetes_hotspot)){
		adresse_requete = rand()%adresse_max;
		if(adresse_requete < debut_hotspot || adresse_requete > fin_hotspot){
			adresses_generees[requetes_acceptees] = adresse_requete;
			requetes_acceptees++;
		}
	}

	//Génération des adresses du hotspot
	for(i=(nb_requetes_total-nb_requetes_hotspot); i<nb_requetes_total; i++){
		adresse_requete = rand()%taille_hotspot + debut_hotspot;
		adresses_generees[i] = adresse_requete;
	}

	//Impression dans un fichier
	fichier_sortie = fopen(NOM_FICHIER,"w+");
	for(i=0; i<nb_requetes_total; i++){
		fprintf(fichier_sortie, "%d %d\n", i+1, adresses_generees[i]);
	}

	exit(0);
}