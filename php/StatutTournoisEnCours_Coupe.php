<?php
	include_once('../module/FctGenerales.php');
	include_once('../BDD/reqGestionnaire.php');
	include_once('../BDD/reqJoueur.php');
	include_once('../BDD/reqEquipeTournoi.php');
	include_once('../BDD/reqEquipeMatchT.php');
	include_once('../BDD/reqMatchPoule.php');
	include_once('../BDD/reqMatchT.php');
	include_once('../BDD/reqPoule.php');
	include_once('../BDD/reqEquipePoule.php');
	include_once('../module/TasMax.php');
	
	session_start();
	
	if(!isset($_SESSION['login']))
	{
		trigger_error("Vous ne pouvez pas accéder à cette page.");
		header('Location: Tournois.php');
		exit();
	}
	
	$ut = getUtilisateurWithEmail($_SESSION['login']);
	$estAdministrateur = ($ut->getRole() === "Administrateur");
	$estGestionnaire = estGestionnaire($ut->getIdUtilisateur());
	$id = $ut->getIdUtilisateur();
	
	if(!$estGestionnaire)
	{
		if(!$estAdministrateur)
		{
			trigger_error("Vous n'avez pas les droits !");
			header('Location: Tournois.php');
			exit();
		}
	}
	
	$id = $_SESSION['tournoi'] ;
	$tournoi = getTournoi($id);
	$tabEquipesTournoi = getEquipeTournoiWithIdTournoi($tournoi->getIdTournoi());
	
	$tabMatchPoules = getAllMatchPouleTournoi($tournoi->getIdTournoi());
	$tabPoules = getAllPouleTournoi($tournoi->getIdTournoi());
	$tabEquipes = getAllEquipeOfTournoi($tournoi->getIdTournoi());
	
	if(isset($_POST) && isset($_POST["EnvoyerValeurs"]))
	{
		for($i=0;$i<sizeof($tabMatchPoules);++$i)
		{
			updateScoreMatchPoule($tabMatchPoules[$i]->getIdEquipe1(), $tabMatchPoules[$i]->getIdEquipe2(), $tabMatchPoules[$i]->getIdMatchT(), rand(1, 15));
			header('Refresh:0; url=StatutTournoisEnCours_Coupe.php');
		}
	}
	
	$_POST = array();
?>

<!DOCTYPE html>
<html lang="fr">
	<head>
		<meta charset="UTF-8" />
		<link rel="stylesheet" type="text/css" href="../css/styleStatut.css" />
		<title>Saisie matchs coupe</title>
	</head>
	
	<body>
		<div class="bandeau-haut">
			<?php 
				echo'<h1>'.$tournoi->getNom().'</h1>';
			?>
		</div>
		
		<br />
		<br />
		
		<div class="container-main2">
			<h1 style="font-size:35px"></h1>
			
			<?php
				for($i=0;$i<sizeof($tabPoules);++$i)
				{
					$numPouleCourante = ($i + 1);
					
					echo '<div class="tabSpec">';
					echo"
					<table>
						<tr>
							<th colspan=\"4\">
								<h2 style=\"text-align:center; margin:5px\"> 
									Poule N°$numPouleCourante
								</h2>
							</th>
						</tr>
						
						<tr>
							<th rowspan=\"1\">Matchs</th>
							<th>Equipe A</th>
							<th>Equipe B</th>
							<th>Score</th>
						</tr>";
					
					for($j=0;$j<sizeof($tabMatchPoules);++$j)
					{
						$matchCourant = ($j + 1);
						
						$eq1 = getEquipe($tabMatchPoules[$j]->getIdEquipe1());
						$eq2 = getEquipe($tabMatchPoules[$j]->getIdEquipe2());
						
						$nomEquipeA = $eq1->getNomEquipe();
						$nomEquipeB = $eq2->getNomEquipe();
						
						$matchT = getMatchT($tabMatchPoules[$j]->getIdMatchT());
						
						$scoreMatchPoules = $tabMatchPoules[$j]->getScore();
						
						$pouleCourante = getPouleWithMatchPoule($tabMatchPoules[$j]);
						
						if($pouleCourante->getIdPoule() == $tabPoules[$i]->getIdPoule())
						{
							echo "<tr><td>$matchCourant</td>
							<td>$nomEquipeA</td>
							<td>$nomEquipeB</td>
							<td>$scoreMatchPoules</td>";
						}
					}
					
					echo '</table>
					</div>';
				}
			?>
			
			<form action="StatutTournoisEnCours_Coupe.php" method="post">
				<input type="submit" name="EnvoyerValeurs" value="Saisir scores aléatoires">
				<button type="submit" id="btn2" value="">Retour</button>
			</form>
		</div>
	</body>
</h1>