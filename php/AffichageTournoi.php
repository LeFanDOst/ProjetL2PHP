<?php
	include_once('../BDD/reqGestionnaire.php');
	include_once('../BDD/reqJoueur.php');
	include_once('../BDD/reqEquipeTournoi.php');
	include_once('../BDD/reqEquipeMatchT.php');
	include_once('../module/TasMax.php');

	ini_set('display_errors',1);
	ini_set('display_startup_errors',1);
	error_reporting(E_ALL);

	session_start();
	
	if(!isset($_SESSION['tournoiEnCours']))
	{
		trigger_error("ERREUR : Aucun tournoi n'a été sélectionné.");
	}
	
	$tournoi = getTournoi($_SESSION['tournoiEnCours']);
	$id = $tournoi->getIdTournoi();

	$retour = "";
	if(isset($_SESSION['login']))
	{
		$ut = getUtilisateurWithEmail($_SESSION['login']);
		$estAdministrateur = ($ut->getRole() === "Administrateur");
		$estGestionnaire = estGestionnaire($ut->getIdUtilisateur());

		if($estGestionnaire || $estAdministrateur)
		{
			$retour = "<form action=\"StatutTournoiEnCours.php\" method=\"post\">
			<button type=\"submit\" id=\"btn1\" name=\"\" >Retour</button>
			</form>";
		}

	}
	

	$tabEquipesTournoi = getEquipeTournoiWithIdTournoi($id);
	$tabEquipesMatchsTemp = getAllEquipeMatchT($id);

	$tabEquipesBonSens = array();

	$bool = estPuissanceDe2($id);
	$taille  = sizeof($tabEquipesTournoi) ;
	$k = 0 ;
	$surplus = 0 ;
	if(!$bool)
	{
		while(pow(2,$k)<$taille)
			++$k ;
		--$k;
		$surplus = $tournoi->getNombreTotalEquipes() - pow(2,$k) ;
	}


	for($i=0;$i<sizeof($tabEquipesTournoi)-$surplus;++$i)
	{
		$ide = $tabEquipesMatchsTemp[$i]->getIdEquipe();
		$tabEquipesBonSens[$i] = getEquipe($ide);
	}

	$tabEquipes = array();
	
	for($i=0;$i<sizeof($tabEquipesBonSens);++$i)
	{
		array_push($tabEquipes, getEquipe($tabEquipesBonSens[$i]->getIdEquipe() ));
	}

	$tasMax = new TasMax(sizeof($tabEquipes));
	$tasMax->insererAuxFeuilles($tabEquipes);
	$tabMatchs = getAllEquipeMatchT($_SESSION['tournoiEnCours']);
	$tasMax->Update($id);

	$tabMatchs = $tasMax->getTabMatchs();

	$z = sizeof($tabMatchs)-1;

	while(($z != 0) && ($tabMatchs[(($z / 2) - 1)] != null))
	{
		$z = $z - 2;
	}
	$deb = $z;
	$fin = $z / 2;
?>

<!DOCTYPE html>
<html lang="fr">
<head>
	<link rel="stylesheet" type="text/css" href="../css/Arbre.css" />
	<title> Statut </title>
</head>
<body>
	<div class="bandeau-haut">
		<?php 
			echo'<h1>'.$tournoi->getNom().'</h1>';
		?>
	</div>
	<hr>
	<hr>
	<?php
		$tasMax->afficherArbre();	
	?>
</body>
<form action="Tournois.php" method="post">
	<button type="submit" id="btn1" name="" value="">Liste Tournois</button>
</form>
<?php
	echo $retour ;
?>
</html>