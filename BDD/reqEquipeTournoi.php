<?php
	include_once('reqEquipe.php');
	include_once('reqTournoi.php');
	include_once('../module/EquipeTournoi.php');
	include_once('../module/FctGenerales.php');
	
	function insertEquipeTournoi(int $idE, int $idT, bool $estInscrite)
	{
		include('DataBaseLogin.inc.php');
		
		if(!estEquipe($idE))
			trigger_error("ERREUR : Identifiant d'équipe invalide.");
		
		if(!estTournoi($idT))
			trigger_error("ERREUR : Identifiant de tournoi invalide.");
		
		$connexion = new mysqli($server, $user, $passwd, $db);
	
		if($connexion->connect_error)
		{
			echo('Erreur de connexion('.$connexion->connect_errno.') '.$connexion->connect_error);
		}
		
		$estIns = bool2SQLStr($estInscrite);
		
		$requete = "INSERT INTO EquipeTournoi(`idEquipe`, `idTournoi`, `estInscrite`) VALUES($idE, $idT, $estIns);";
		
		$res = $connexion->query($requete);
		if(!$res)
			die('Echec lors de l\'exécution de la requête: ('.$connexion->errno.') '.$connexion->error);
		
		$connexion->close();
		
		unset($_POST);
		
		header('Location: ../php/resPreInscription.php');
		exit();
	}
	
	function modifierEquipeTournoi(int $idE, int $idT, bool $estInscrite)
	{
		include('DataBaseLogin.inc.php');
		
		if(!estEquipe($idE))
			trigger_error("ERREUR : Identifiant d'équipe invalide.");
		
		if(!estTournoi($idT))
			trigger_error("ERREUR : Identifiant de tournoi invalide.");
		
		$connexion = new mysqli($server, $user, $passwd, $db);
	
		if($connexion->connect_error)
		{
			echo('Erreur de connexion('.$connexion->connect_errno.') '.$connexion->connect_error);
		}
		
		$estIns = bool2SQLStr($estInscrite);
		
		$requete = "UPDATE EquipeTournoi SET estInscrite = $estIns WHERE idEquipe = $idE AND idTournoi = $idT;";
		
		$res = $connexion->query($requete);
		if(!$res)
			die('Echec lors de l\'exécution de la requête: ('.$connexion->errno.') '.$connexion->error);
		
		$connexion->close();
		
		unset($_POST);
		
		return true;
	}
	
	function supprimerEquipeTournoi(int $idE, int $idT)
	{
		include('DataBaseLogin.inc.php');
		
		if(!estEquipe($idE))
			trigger_error("ERREUR : Identifiant d'équipe invalide.");
		
		if(!estTournoi($idT))
			trigger_error("ERREUR : Identifiant de tournoi invalide.");
		
		$connexion = new mysqli($server, $user, $passwd, $db);
	
		if($connexion->connect_error)
		{
			echo('Erreur de connexion('.$connexion->connect_errno.') '.$connexion->connect_error);
		}
		
		$requete = "DELETE FROM EquipeTournoi WHERE idEquipe = $idE AND idTournoi = $idT;";
		
		$res = $connexion->query($requete);
		if(!$res)
			die('Echec lors de l\'exécution de la requête: ('.$connexion->errno.') '.$connexion->error);
		
		$connexion->close();
		
		unset($_POST);
		
		return true;
	}
	
	function estEquipeTournoi(string $idE, string $idT)
	{
		include('DataBaseLogin.inc.php');
		
		$connexion = new mysqli($server, $user, $passwd, $db);
	
		if($connexion->connect_error)
		{
			echo('Erreur de connexion('.$connexion->connect_errno.') '.$connexion->connect_error);
		}
		
		$requete = "SELECT idEquipe, idTournoi FROM EquipeTournoi WHERE idEquipe = $idE AND idTournoi = \"$idT\";";
		
		$res = $connexion->query($requete);
		if(!$res)
		{
			die('Echec lors de l\'exécution de la requête: ('.$connexion->errno.') '.$connexion->error);
			$connexion->close();
			
			return false;
		}
		
		$objTemp = $res->fetch_object();
		$idEquipe = strval($objTemp->idEquipe);
		$idTournoi = strval($objTemp->idTournoi);
		
		$connexion->close();
		
		if(empty($idEquipe))
			return false;
		
		if(empty($idTournoi))
			return false;
		
		return true;
	}
	
	function getEquipeTournoi(string $idE, string $idT)
	{
		include('DataBaseLogin.inc.php');
		
		$connexion = new mysqli($server, $user, $passwd, $db);
	
		if($connexion->connect_error)
		{
			echo('Erreur de connexion('.$connexion->connect_errno.') '.$connexion->connect_error);
		}
		
		$requete = "SELECT * FROM EquipeTournoi WHERE idEquipe = $idE AND idTournoi = \"$idT\";";
		
		$res = $connexion->query($requete);
		if(!$res)
		{
			die('Echec lors de l\'exécution de la requête: ('.$connexion->errno.') '.$connexion->error);
			$connexion->close();
			
			return NULL;
		}
		
		$objTemp = $res->fetch_object();
		$idEquipe = strval($objTemp->idEquipe);
		$idTournoi = strval($objTemp->idTournoi);
		$estInscrite = strval($objTemp->estInscrite);
		
		$connexion->close();
		
		if(empty($idEquipe))
			return NULL;
		
		if(empty($idTournoi))
			return NULL;
		
		return new EquipeTournoi($idEquipe, $idTournoi, $estInscrite);
	}
	
	function getEquipeTournoiWithIdTournoi(string $idT)
	{
		include('DataBaseLogin.inc.php');
		
		$connexion = new mysqli($server, $user, $passwd, $db);
	
		if($connexion->connect_error)
		{
			echo('Erreur de connexion('.$connexion->connect_errno.') '.$connexion->connect_error);
		}
		
		$requete = "SELECT E.idEquipe, ET.idTournoi
		FROM Equipe E
		INNER JOIN EquipeTournoi ET
		WHERE E.idEquipe = ET.idEquipe AND ET.idTournoi = $idT;";
		
		$res = $connexion->query($requete);
		if(!$res)
		{
			die('Echec lors de l\'exécution de la requête: ('.$connexion->errno.') '.$connexion->error);
			$connexion->close();
			
			return NULL;
		}
		
		//$res->fetch_assoc();
		$nbEquipeTournoi = $res->num_rows;
		
		$connexion->close();
		
		$tabEquipeTournoi = array();
		
		if($nbEquipeTournoi == 0)
			return $tabEquipeTournoi;
		
		while($obj = $res->fetch_object())
		{
			array_push($tabEquipeTournoi, getEquipeTournoi($obj->idEquipe, $idT));
		}
		
		return $tabEquipeTournoi;
	}
?>