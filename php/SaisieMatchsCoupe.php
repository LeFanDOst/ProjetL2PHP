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
	//$tabMatchsPoule = getAllMatchPouleTournoi();
	

	/*$nbEquipesInscrites = 0;
	$tabEquipes = array();
	
	for($i=0;$i<sizeof($tabEquipesTournoi);++$i)
	{
		if($tabEquipesTournoi[$i]->getEstInscrite())
			++$nbEquipesInscrites;
		
		array_push($tabEquipes, getEquipe($tabEquipesTournoi[$i]->getIdEquipe()));
	}
	
	$nbEquipesTotal = $tournoi->getNombreTotalEquipes();
	
	$tabMatchs = getAllMatchT($tournoi->getIdTournoi());
	
	$tabEquipesMatchT = getAllEquipeMatchT($tournoi->getIdTournoi());*/
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
							<th colspan=\"5\">
								<h2 style=\"text-align:center; margin:5px\"> 
									Poule N°$numPouleCourante
								</h2>
							</th>
						</tr>
						
						<tr>
							<th rowspan=\"1\">Matchs</th>
							<th>Equipe A</th>
							<th>Equipe B</th>
							<th>Date/Horaire</th>
							<th>Statut match</th>
						</tr>";
					
					for($j=0;$j<sizeof($tabMatchPoules);++$j)
					{
						$matchCourant = ($j + 1);
						
						$eq1 = getEquipe($tabMatchPoules[$j]->getIdEquipe1());
						$eq2 = getEquipe($tabMatchPoules[$j]->getIdEquipe2());
						
						$nomEquipeA = $eq1->getNomEquipe();
						$nomEquipeB = $eq2->getNomEquipe();
						
						$matchT = getMatchT($tabMatchPoules[$j]->getIdMatchT());
						
						$dateMatchT = $matchT->getDate();
						$horaireMatchT = $matchT->getHoraire();
						
						$pouleCourante = getPouleWithMatchPoule($tabMatchPoules[$j]);
						
						if($pouleCourante->getIdPoule() == $tabPoules[$i]->getIdPoule())
						{
							echo "<tr><td>$matchCourant</td>
							<td>$nomEquipeA</td>
							<td>$nomEquipeB</td>
							<td>$dateMatchT $horaireMatchT</td>
							<td>Validé</td></tr>";
						}
					}
					
					echo '</table>
					</div>';
				}
				
				/*if(count($tabEquipesMatchT) > 0)
				{
					$indexMatch = 1;
					
					for($i=0;$i<count($tabEquipesMatchT);$i = $i + 2)
					{
						$e1 = getEquipe($tabEquipesMatchT[$i]->getIdEquipe());
						$e2 = getEquipe($tabEquipesMatchT[$i+1]->getIdEquipe());
						
						$nom1 = $e1->getNomEquipe();
						$nom2 = $e2->getNomEquipe();
						
						echo '<tr><td style="font-weight: bold">Match n°'.$indexMatch.'</td><td>'.$nom1.'</td><td>'.$nom2.'</td><td>'.date("d/m/Y",strtotime($tabMatchs[$indexMatch-1]->getDate())).' '.$tabMatchs[$indexMatch-1]->getHoraire().'</td><td>Validé<td></tr>';
						
						++$indexMatch;
					}
				}
				
				echo '</table>
				</form>
				</div>';
				
				if(sizeof($tabEquipesMatchT)!= ($nbEquipesTotal*($nbEquipesTotal-1)) )
				{
					echo '
					<form action="SaisieMatchsCoupe.php" method="post">
						<button type="submit" id="btn2" name="Saisir" value="" style="margin:auto">Saisir</button>
					</form>';
				}*/
			?>
			
			<form action="StatutTournoisAVenir_Coupe.php" method="post">
				<button type="submit" id="btn2" value="">Retour</button>
			</form>
		</div>
	</body>
</h1>