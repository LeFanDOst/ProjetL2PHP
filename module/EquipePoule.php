<?php
	include_once('Entite.php');
	include_once(realpath(dirname(__FILE__)).'/../module/Poule.php');
	include_once(realpath(dirname(__FILE__)).'/../BDD/reqPoule.php');
	include_once(realpath(dirname(__FILE__)).'/../BDD/reqEquipePoule.php');
	
	class EquipePoule extends Entite
	{
		private $m_idEquipe ;
		private $m_idPoule;
		private $m_idMatchT ;
		private $m_score = -1 ;
		
		//Constructeur
		public function __construct(int $idEquipe, int $idPoule, int $idMatch, int $score)
		{
			$this->m_idEquipe = $idEquipe ;
			$this->m_idPoule = $idPoule;
			$this->m_idMatchT = $idMatchT ;	
			$this->m_score = $score;
		}
		
		//ACESSEURS EN LECTURE

		public function getIdEquipe()
		{
			return $this->m_idEquipe;
		}
		
		public function getIdPoule()
		{
			return $this->m_idPoule;
		}
		
		public function getIdMatchT()
		{
			return $this->m_idMatchT;
		}
		
		public function getScore()
		{
			return $this->m_score ;
		}

	}
?>