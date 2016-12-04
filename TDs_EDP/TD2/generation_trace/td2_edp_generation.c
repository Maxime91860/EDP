

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

	if(argc < 2){
		fprintf(stderr, "Erreur arguments : \nUsage : %s <Taille Hostspot>\n",argv[0]);
		exit(-1);
	}

	int adresses_generees[10000]; //On a 10000 adresses à générer 
	int taille_hotspot;
	int debut_hotspot;
	int fin_hotspot;
	int adresse_requete;
	int requetes_acceptees;
	int adresse_max;
	int i;
	FILE* fichier_sortie;

	adresse_max = TAILLE_ESPACE_ADRESSAGE / TAILLE_BLOC_MEMOIRE;
	taille_hotspot = atoi(argv[1]);
	if(taille_hotspot >=  adresse_max){
		fprintf(stderr, "Taille de Hotspot trop grande.\n");
		exit(-1);
	}
	srand(taille_hotspot);
	debut_hotspot = rand()%adresse_max;
	fin_hotspot = debut_hotspot + taille_hotspot;

	printf("Hotspot de : @%d à @%d\n",debut_hotspot, fin_hotspot);

	//Génération des adresses hors hotspot
	requetes_acceptees = 0;
	while (requetes_acceptees != 1000){
		adresse_requete = rand()%adresse_max;
		if(adresse_requete < debut_hotspot || adresse_requete > fin_hotspot){
			adresses_generees[requetes_acceptees] = adresse_requete;
			requetes_acceptees++;
		}
	}

	//Génération des adresses du hotspot
	for(i=1000; i<10000; i++){
		adresse_requete = rand()%taille_hotspot + debut_hotspot;
		adresses_generees[i] = adresse_requete;
	}

	//Impression dans un fichier
	fichier_sortie = fopen(NOM_FICHIER,"w+");
	for(i=0; i<10000; i++){
		fprintf(fichier_sortie, "%d %d\n", i, adresses_generees[i]);
	}

	exit(0);
}