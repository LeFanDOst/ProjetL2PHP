<!DOCTYPE html>
<html lang="fr">
	<head>
		<link rel="stylesheet" type="text/css" href=".././css/styleTournois.css" />
		<title> Liste des Tournois </title>
		<style>
			body .bandeau-haut img {
				width:70px;
				padding:5px 0 0 5px;
				margin:5px 0 0 5px;
				float:left;
			}
			p, h2, li, ul {
				color: white;
				text-align: justify;
			}
			a { color:  #fdfefe ; }
			a:hover {
				color:#0073e6;
			 }
		</style>
	</head>
	<body>
		<div class="bandeau-haut">
			<a href="../index.php">
				<img src="../img/prev.png">
				<h3>RETOUR</h3>
			</a>
		</div>
		<div class="cadre">
			<h1>
				<p>Fonctionnement</p>
			</h1>
			<hr>
			<h2>Bienvenue sur notre site de gestion de tournois sportif. Voici quelque informations utiles / importantes pour comprendre comment correctement utiliser ce site.</h2>
			<p>Dans un premier temps, nous vous invitons à vous <a href="./Inscription.php" >créer un compte</a> adapté à ce que vous voulez faire :</p>
			<ul>
					<li><b>utilisateur</b>, si vous voulez voir l'avancement des tournois</li>
					<li><b>joueur</b>, si vous voulez rentrer dans une équipe et prendre part aux tournois</li>
					<li><b>capitaine</b>, si vous voulez créer une équipe et choisir dans quel.s tournoi.s jouer</li>
			</ul>
			<p>Si vous voulez créer un tournoi il faudra contacter les administrateurs, les information nécessaire pour ce faire sont dans <a href="./contact.php" >contact</a>. </p>
			<p>Vous devrez communiquer :</p>
			<ul>
					<li>le nom de votre compte</li>
					<li>le nom du tournoi</li>
					<li>le type de tournoi <a style="color: red;">(entre coupe, tournois, championnat )</a></li>
					<li>le lieu <a style="color: red;">(en France)</a></li>
					<li>la date de début</li>
					<li>la durée</li>
					<li>le nombre d'équipes <a style="color: red;">(une puissance de 2)</a></li>
			</ul>
			<p> Votre tournoi sera alors créé dans les plus bref délais et vous en serez le gestionnaire ; ce sera donc à vous de valider les inscriptions, dater les matchs et d'inscrire les scores.</p>
			<h2>Inscriptions aux tournois :</h2>
			<p>Seul le capitaine d'une équipe peut pré-inscrire cette dernière, le gestionnaire du tournoi validera ou non la pré-inscription.</p>
			<h1>
				<p>Les types de tournois</p>
			</h1>
			<hr>
			<h2>Championnat</h2>
			 	<p>Toutes les équipes s'affrontent. Des points sont attribués selon les victoires / matchs nuls / défaites. L'équipe qui a le plus de point quand tout les matchs sont joués gagne.</p> 
				<p>L’attribution des points s’organise de la manière suivante :</p>
				<ul>
					<li>victoire = 4 points</li>
					<li>match nul = 2 points</li>
					<li>défaite = 1 point</li>
				</ul>
			<h2>Coupe</h2>
			<p>Chaque tour, les équipe s'affrontent 2 à 2. La perdante est éliminée et la gagnante passe au tour suivant.</p>
			<h2>Tournois</h2>
			<p>Séparé en deux parties :</p>
			<ul>
				<li>une phase de poule, où les équipe sont réparties en groupe de 4 et font un championnat entre elle, puis les deux première passent à la phase finale</li>
				<li>une phase finale, où les équipes s'affrontent comme lors d'une coupe (les premières équipes de chaque poule affrontent les deuxièmes d'une autre poule)</li>
			</ul>
		</div>
	</body>
</html>
