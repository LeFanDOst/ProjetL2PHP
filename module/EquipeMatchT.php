<?php
	include_once('../module/MatchT.php');
	
	class EquipeMatchT extends MatchT
	{
		private $m_idEquipe;
		private $m_score = -1;
		
		public function __construct(int $idEquipe,int $idMatch)
		{
			parent:: __construct($idMatch);
			$this->m_idEquipe = $idEquipe;
		}
		
		//ACCESSEURS EN LECTURE
		public function afficher()
		{
			echo"ID équipe : ".$this->m_idEquipe."<br ./>";
			echo"ID Match : ".$this->m_idMatchT."<br ./>";
			echo"Score : ".$this->m_score."<br ./>";
		}
		
		public function getIdEquipe()
		{
			return $this->m_idEquipe;
		}
		
		public function getScore()
		{
			return $this->m_score ;
		}
		
		//ACCESSEURS EN ECRITURE
		public function setScore()
		{
			//setScoreAleatoire
			$this->m_score = rand(0,10);
		}

		public function setScoreVal($score)
		{ 
			$this->m_score = $score ;
		}
		
		public function toString()
		{
			$res = parent::toString();
			
			$res = $res
				  ." "
				  .strval($this->m_idEquipe);
			
			return $res;
		}
		
		public function toHTML()
		{
			$res = parent::toHTML();
			
			$res = $res
				  ."<p>"
				  .strval($this->m_idEquipe)
				  ."</p>";
			
			return $res;
		}
	}
?>