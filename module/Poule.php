<?php
	include_once('Entite.php');
	include_once(realpath(dirname(__FILE__)).'/../BDD/reqPoule.php');
	
	class Poule extends Entite
	{
		private $m_idPoule;
		private $m_idTournoi ;
		private $m_nbEquipes ;
		
		//Constructeur
		public function __construct(int $idPoule, int $idTournoi, int $nbEquipes)
		{
			$this->m_idPoule = $idPoule;
			$this->m_idTournoi = $idTournoi ;
			$this->m_nbEquipes = $nbEquipes ;
		}
		
		//ACESSEURS EN LECTURE
		
		public function getIdPoule()
		{
			return $this->m_idPoule;
		}
		
		public function getIdTournoi()
		{
			return $this->m_idTournoi;
		}

		public function getNbEquipes()
		{
			return $this->m_nbEquipes;
		}


		//ACESSEURS EN ECRITURE
		
		public function setIdPoule($idPoule)
		{
			$this->m_idPoule = $idPoule;
		}

		public function setIdTournoi($idTournoi)
		{
			$this->m_idTournoi = $idTournoi;
		}

		public function setNbEquipes($nbEquipes)
		{
			$this->m_nbEquipes = $nbEquipes;
		}

	}
?>