<?php
	include_once('../BDD/reqGestionnaire.php');
	include_once('../BDD/reqTournoi.php');
	include_once('../BDD/reqPoule.php');
	
	session_start();
	
	if(!isset($_SESSION['login']))
		trigger_error("Vous n'êtes pas connecté.e !");
	
	$ut = getUtilisateurWithEmail($_SESSION['login']);
	$estAdministrateur = ($ut->getRole() === "Administrateur");
	$estGestionnaire = estGestionnaire($ut->getIdUtilisateur());
	$idU = $ut->getIdUtilisateur();
	
	$id = $_SESSION['tournoi'] ;
	$tournoi = getTournoi($id);

	if(!($idU === $tournoi->getIdGestionnaire()) && !$estAdministrateur)
	{
		trigger_error("ERREUR : Vous n'êtes pas le gestionnaire de ce tournoi ni un administrateur du site !");
	}
	
	if(isset($_POST) && isset($_POST["EnvoyerValeurs"]))
	{
		echo "yo";
		$poule = insertPoule($_SESSION["tournoi"], $_POST["NbEquipes"]);
		
		$_SESSION["pouleCreee"] = $poule->getIdPoule();
		
		unset($_POST);
		
		header("Location: AffecterEquipesPoule.php");
		exit();
	}
	
	$_POST = array();
?>

<!DOCTYPE html>
<html lang="fr">
	<head>
		<meta charset="utf-8" />
		<link rel="stylesheet" type="text/css" href="../css/style.css" />
		<title>Créer une poule</title>
	</head>
	
	<body>
		<h1>Créer une poule</h1>
		
		<form action="CreerPoule.php" method="post">
			<label for="NbEquipes">Nombre d'équipes</label>
			<input type="number" name="NbEquipes" id="NbEquipes" required>
			
			<input type="submit" name="EnvoyerValeurs" value="EnvoyerValeurs">
		</form>
	</body>
</html>