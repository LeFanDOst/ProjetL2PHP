<?php
	include_once('TasMax.php');
	include_once('Gestionnaire.php');
	
	class Tournoi
	{
		private $m_tasMax;
		
		private $m_idTournoi;
		private $m_nom;
		private $m_dateDeb;
		private $m_duree;
		private $m_gestionnaire;
		private $m_lieu;
		private $m_nombreTotalEquipes;
		
		private $m_tableauEquipes;
		
		public function __construct(int $idT, string $nom, string $dateDeb, string $duree, int $idGestionnaire, string $lieu, string $nombreTotalEquipes)
		{
			$this->m_idTournoi = $idT;
			$this->m_nom = $nom;
			$this->m_dateDeb = $dateDeb;
			$this->m_duree = $duree;
			$this->m_idGestionnaire = $idGestionnaire;
			$this->m_lieu = $lieu;
			$this->m_nombreTotalEquipes = $nombreTotalEquipes;
		}
		
		public function getIdTournoi()
		{
			return $this->m_idTournoi;
		}
		
		public function getNom()
		{
			return $this->m_nom;
		}
		
		public function getDateDeb()
		{
			return $this->m_dateDeb;
		}
		
		public function getDuree()
		{
			return $this->m_duree;
		}
		
		public function getGestionnaire()
		{
			return $this->m_gestionnaire;
		}
		
		public function getLieu()
		{
			return $this->m_lieu;
		}
		
		public function getNombreTotalEquipes()
		{
			return $this->m_nombreTotalEquipes;
		}

		public function termine(){
			$ajoutDuree = strtotime($this->m_dateDeb. '+'.$this->m_duree.' days');
			$today = strtotime(date("d-m-Y"));
			//echo $this->m_dateDeb ;
			//echo '<br ./>';

			return ($ajoutDuree<$today) ;
		}

		public function enCours(){
			$dateTournoi = strtotime($this->m_dateDeb);
			$today = strtotime(date("d-m-Y"));
			$ajoutDuree = strtotime($this->m_dateDeb. '+'.$this->m_duree.' days');
			
			return ($dateTournoi<=$today)&&($ajoutDuree>=$today) ;
		}

		public function aVenir(){
			$dateTournoi = strtotime($this->m_dateDeb);
			$today = strtotime(date("d-m-Y"));
			return ($dateTournoi>$today);
		}

		public function toString()
		{
			$res = strval($this->m_idTournoi)." "
				  .strval($this->m_nom)." "
				  .strval($this->m_dateDeb)." "
				  .strval($this->m_duree)."\n"
				  //.strval($this->m_gestionnaire->toString())."\n"
				  .strval($this->m_lieu)." "
				  .strval($this->m_nombreTotalEquipes);
			
			return $res;
		}
		
		public function toHTML()
		{
			$res = "<p>"
				  .strval($this->m_idTournoi)." <br />"
				  .strval($this->m_nom)." <br />"
				  .strval($this->m_dateDeb)." <br />"
				  .strval($this->m_duree)." <br />"
				  //.strval($this->m_gestionnaire->toHTML())." <br />"
				  .strval($this->m_lieu)." <br />"
				  .strval($this->m_nombreTotalEquipes)
				  ."</p>";
			
			return $res;
		}
	}
?>