<?php
	include_once('reqUtilisateur.php');
	include_once('../module/Utilisateur.php');
	include_once('../module/Gestionnaire.php');
	
	function insertGestionnaireForExistingUtilisateur(int $idG)
	{
		include('DataBaseLogin.inc.php');
		
		$connexion = new mysqli($server, $user, $passwd, $db);
	
		if($connexion->connect_error)
		{
			echo('Erreur de connexion('.$connexion->connect_errno.') '.$connexion->connect_error);
		}
		
		$requete = "INSERT INTO Gestionnaire VALUES($idG);";
		
		$res = $connexion->query($requete);
		if(!$res)
			die('Echec lors de l\'exécution de la requête: ('.$connexion->errno.') '.$connexion->error);
		
		$connexion->close();
		
		unset($_POST);
		
		echo "1";
		
		header('Location: ../php/resCreerGestionnaire.php');
		exit();
	}
	
	function estGestionnaire(string $id)
	{
		include('DataBaseLogin.inc.php');
		
		$connexion = new mysqli($server, $user, $passwd, $db);
	
		if($connexion->connect_error)
		{
			echo('Erreur de connexion('.$connexion->connect_errno.') '.$connexion->connect_error);
		}
		
		$requete = "SELECT idGestionnaire FROM Gestionnaire WHERE idGestionnaire = \"$id\";";
		
		$res = $connexion->query($requete);
		if(!$res)
		{
			die('Echec lors de l\'exécution de la requête: ('.$connexion->errno.') '.$connexion->error);
			$connexion->close();
			
			return false;
		}
		
		$idGestionnaire = strval($objTemp->idGestionnaire);
		
		$connexion->close();
		
		if(empty($idGestionnaire))
			return false;
		
		return true;
	}
	
	function getGestionnaire(string $id)
	{
		include('DataBaseLogin.inc.php');
		
		$connexion = new mysqli($server, $user, $passwd, $db);
	
		if($connexion->connect_error)
		{
			echo('Erreur de connexion('.$connexion->connect_errno.') '.$connexion->connect_error);
		}
		
		$requete = "SELECT * FROM Gestionnaire WHERE idGestionnaire = \"$id\";";
		
		$res = $connexion->query($requete);
		if(!$res)
		{
			die('Echec lors de l\'exécution de la requête: ('.$connexion->errno.') '.$connexion->error);
			$connexion->close();
			
			return NULL;
		}
		
		$idGestionnaire = strval($objTemp->idGestionnaire);
		
		$connexion->close();
		
		if(empty($idGestionnaire))
			return NULL;
		
		$ut = getUtilisateur($id);
		
		return new Gestionnaire($ut->getIdUtilisateur(), $ut->getNom(), $ut->getPrenom(), $ut->getEmail(), $ut->getMdp(), $ut->getRole(), $idGestionnaire);
	}
?>