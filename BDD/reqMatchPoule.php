<?php
	include_once(realpath(dirname(__FILE__)).'/../BDD/reqGeneralBDD.php');
	include_once(realpath(dirname(__FILE__)).'/../module/MatchPoule.php');
	include_once(realpath(dirname(__FILE__)).'/../module/Poule.php');
	
	function insertMatchPoule(int $idEquipe1, int $idEquipe2, int $idMatchT, int $score1, int $score2)
	{
		include('DataBaseLogin.inc.php');
		
		$connexion = new mysqli($server, $user, $passwd, $db);
	
		if($connexion->connect_error)
		{
			echo('Erreur de connexion('.$connexion->connect_errno.') '.$connexion->connect_error);
		}
		
		$requete = "INSERT INTO MatchPoule VALUES($idEquipe1, $idEquipe2, $idMatchT, $score1, $score2);";
		
		$res = $connexion->query($requete);
		if(!$res)
			die('Echec lors de l\'exécution de la requête: ('.$connexion->errno.') '.$connexion->error);
		
		$connexion->close();
		
		return new MatchPoule($idEquipe1, $idEquipe2, $idMatchT, $score1, $score2);
	}
	
	function updateScoreMatchPoule(int $idEquipe1, int $idEquipe2, int $idMatchT, int $score1, int $score2)
	{
		include('DataBaseLogin.inc.php');
		
		$connexion = new mysqli($server, $user, $passwd, $db);
	
		if($connexion->connect_error)
		{
			echo('Erreur de connexion('.$connexion->connect_errno.') '.$connexion->connect_error);
		}
		
		$requete = "UPDATE MatchPoule SET score1 = $score1, score2 = $score2 WHERE idEquipe1 = $idEquipe1 AND idEquipe2 = $idEquipe2 AND idMatchT = $idMatchT;";
		
		$res = $connexion->query($requete);
		if(!$res)
			die('Echec lors de l\'exécution de la requête: ('.$connexion->errno.') '.$connexion->error);
		
		$connexion->close();
		
		return new MatchPoule($idEquipe1, $idEquipe2, $idMatchT, $score1, $score2);
	}
	
	function estMatchPoule(string $idEquipe1, string $idEquipe2, string $idMatchT)
	{
		include('DataBaseLogin.inc.php');
		
		$connexion = new mysqli($server, $user, $passwd, $db);
	
		if($connexion->connect_error)
		{
			echo('Erreur de connexion('.$connexion->connect_errno.') '.$connexion->connect_error);
		}
		
		$requete = "SELECT idEquipe1, idEquipe2, idMatchT FROM MatchPoule WHERE idEquipe1 = \"$idEquipe1\" AND idEquipe2 = \"$idEquipe2\" AND idMatchT = \"$idMatchT\";";
		
		$res = $connexion->query($requete);
		if(!$res)
		{
			die('Echec lors de l\'exécution de la requête: ('.$connexion->errno.') '.$connexion->error);
			$connexion->close();
			
			return false;
		}
		
		$objTemp = $res->fetch_object();
		
		if(!$objTemp)
			return false;
		
		$idEquipe1 = strval($objTemp->idEquipe1);
		$idEquipe2 = strval($objTemp->idEquipe2);
		$idMatchT = strval($objTemp->idMatchT);
		
		$connexion->close();
		
		if(empty($idEquipe1))
			return false;
		
		if(empty($idEquipe2))
			return false;
		
		if(empty($idMatchT))
			return false;
		
		return true;
	}
	
	function getMatchPoule(string $idEquipe1, string $idEquipe2, string $idMatchT)
	{
		include('DataBaseLogin.inc.php');
		
		$connexion = new mysqli($server, $user, $passwd, $db);
	
		if($connexion->connect_error)
		{
			echo('Erreur de connexion('.$connexion->connect_errno.') '.$connexion->connect_error);
		}
		
		$requete = "SELECT * FROM MatchPoule WHERE idEquipe1 = \"$idEquipe1\" AND idEquipe2 = \"$idEquipe2\" AND idMatchT = \"$idMatchT\";";
		
		$res = $connexion->query($requete);
		if(!$res)
		{
			die('Echec lors de l\'exécution de la requête: ('.$connexion->errno.') '.$connexion->error);
			$connexion->close();
			
			return NULL;
		}
		
		$objTemp = $res->fetch_object();
		$idEquipe1 = intval(strval($objTemp->idEquipe1));
		$idEquipe2 = intval(strval($objTemp->idEquipe2));
		$idMatchT = intval(strval($objTemp->idMatchT));
		$score1 = intval(strval($objTemp->score1));
		$score2 = intval(strval($objTemp->score2));
		
		$connexion->close();
		
		if(empty(strval($idEquipe1)))
			return NULL;
		
		if(empty(strval($idEquipe2)))
			return NULL;
		
		if(empty(strval($idMatchT)))
			return NULL;
		
		return new MatchPoule($idEquipe1, $idEquipe2, $idMatchT, $score1, $score2);
	}

	function getAllMatchPoule()
	{
		include('DataBaseLogin.inc.php');
		
		$connexion = new mysqli($server, $user, $passwd, $db);
		
		if($connexion->connect_error)
		{
			echo('Erreur de connexion('.$connexion->connect_errno.') '.$connexion->connect_error);
		}
		
		$requete = "SELECT * FROM MatchPoule;";
		
		$res = $connexion->query($requete);
		if(!$res)
		{
			die('Echec lors de l\'exécution de la requête: ('.$connexion->errno.') '.$connexion->error);
			$connexion->close();
			
			return NULL;
		}
		
		$nbMatchPoule = $res->num_rows;
		
		$connexion->close();
		
		$tabMatchPoule = array();
		
		if($nbMatchPoule == 0)
			return $tabMatchPoule;
		
		while($obj = $res->fetch_object())
		{
			array_push($tabMatchPoule, getMatchPoule($obj->idEquipe1, $obj->idEquipe2, $obj->idMatchT));
		}
		
		return $tabMatchPoule;
	}
	
	function getAllMatchPouleTournoi(int $idTournoi)
	{
		include('DataBaseLogin.inc.php');
		
		$connexion = new mysqli($server, $user, $passwd, $db);
		
		if($connexion->connect_error)
		{
			echo('Erreur de connexion('.$connexion->connect_errno.') '.$connexion->connect_error);
		}
		
		$requete = "SELECT MP.* FROM MatchPoule MP INNER JOIN MatchT M ON M.idMatchT = MP.idMatchT WHERE M.idTournoi = $idTournoi;";
		
		$res = $connexion->query($requete);
		if(!$res)
		{
			die('Echec lors de l\'exécution de la requête: ('.$connexion->errno.') '.$connexion->error);
			$connexion->close();
			
			return NULL;
		}
		
		$nbMatchPoule = $res->num_rows;
		
		$connexion->close();
		
		$tabMatchPoule = array();
		
		if($nbMatchPoule == 0)
			return $tabMatchPoule;
		
		while($obj = $res->fetch_object())
		{
			array_push($tabMatchPoule, getMatchPoule($obj->idEquipe1, $obj->idEquipe2, $obj->idMatchT));
		}
		
		return $tabMatchPoule;
	}
	
	function getPouleWithMatchPoule($mp)
	{
		include('DataBaseLogin.inc.php');
		
		$connexion = new mysqli($server, $user, $passwd, $db);
	
		if($connexion->connect_error)
		{
			echo('Erreur de connexion('.$connexion->connect_errno.') '.$connexion->connect_error);
		}
		
		$idE1 = $mp->getIdEquipe1();
		$idE2 = $mp->getIdEquipe2();
		
		$requete = "SELECT *
		FROM Poule P
		INNER JOIN EquipePoule EP ON EP.idPoule = P.idPoule
		WHERE (EP.idEquipe IN (SELECT idEquipe1
							   FROM MatchPoule
							   WHERE idEquipe1 = $idE1))
		   OR (EP.idEquipe IN (SELECT idEquipe2
							   FROM MatchPoule
							   WHERE idEquipe2 = $idE2));";
		
		$res = $connexion->query($requete);
		if(!$res)
		{
			die('Echec lors de l\'exécution de la requête: ('.$connexion->errno.') '.$connexion->error);
			$connexion->close();
			
			return NULL;
		}
		
		$objTemp = $res->fetch_object();
		$idPoule = intval(strval($objTemp->idPoule));
		$idTournoi = intval(strval($objTemp->idTournoi));
		$nbEquipes = intval(strval($objTemp->nbEquipes));
		
		$connexion->close();
		
		if(empty(strval($idPoule)))
			return NULL;
		
		return new Poule($idPoule, $idTournoi, $nbEquipes);
	}
?>