#include <iostream>

bool estPair(int nb)
{
	return ((nb % 2) == 0);
}

/*
Calclul :
((nbEquipes - 1) * 2) si nbEquipes pair
(((nbEquipes - 1) * 2) + 1) si nbEquipes impair

((nbEquipes - 1) * nbEquipes)

(((nbEquipes - 1) * nbEquipes) / 2)
*/
int calculNbMatchs(int nbEquipes)
{
	//return (((nbEquipes - 1) * 2) + ((estPair(nbEquipes)) ? 0 : 1));
	//return ((nbEquipes - 1) * nbEquipes);
	return (((nbEquipes - 1) * nbEquipes) / 2);
}

int main()
{
	int nbEquipes;
	
	std::cout << "Veuillez saisir un nombre d'équipes :" << std::endl;
	std::cin >> nbEquipes;
	
	std::cout << "Le nombre de matchs est estimé à : " << calculNbMatchs(nbEquipes) << std::endl;
	
	return 0;
}