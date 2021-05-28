<?php
	include_once(realpath(dirname(__FILE__)).'/../BDD/reqTournoi.php');
	include_once(realpath(dirname(__FILE__)).'/../module/MatchT.php');

	function insertMatchT(int $idTournoi,string $date, string $horaire)
    {
        include('DataBaseLogin.inc.php');

        if(!estTournoi($idTournoi))
			trigger_error("ERREUR : Identifiant de tournoi invalide.");
		
		$connexion = new mysqli($server, $user, $passwd, $db);
	
		if($connexion->connect_error)
		{
			echo('Erreur de connexion('.$connexion->connect_errno.') '.$connexion->connect_error);
		}

        $idMatchT = chooseIntegerIdSequential("MatchT", "idMatchT");

        $requete = "INSERT INTO MatchT VALUES($idMatchT,$idTournoi,'$date','$horaire');";

        $res = $connexion->query($requete);
		if(!$res)
			die('Echec lors de l\'exécution de la requête: ('.$connexion->errno.') '.$connexion->error);
		
		$connexion->close();
		

		return true;
		
		exit();

    }

    // A B C D
    //A vs B
    //A vs C
    //A vs D
    //B vs C
    //B vs D
    //C vs D
    //4 équipes -> 6 matchts = 2^2 + 2  

    //A B C 
    //A vs B
    //A vs C
    //B vs C
    //3 équipes -> 3 matchts = 2^1 + 1


    //A B 
    //A vs B
    //2 équipes -> 1 matchts = 2^0


//CALCULS TOTAL MATCHTS POUR x équipes = arrangements (sans répétition)
//x * (x-1) / 2





?>