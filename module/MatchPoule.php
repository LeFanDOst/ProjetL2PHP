<?php
	class MatchPoule
	{
		private $m_idEquipe;
		private $m_idMatchT;
		private $m_score;
		
		public function __construct(int $idEquipe, int $idMatchT, int $score)
		{
			$this->m_idEquipe = $idEquipe;
			$this->m_idMatchT = $idMatchT;
			$this->m_score = $score;
		}
		
		public function getIdEquipe()
		{
			return $this->m_idEquipe;
		}
		
		public function getIdMatchT()
		{
			return $this->m_idMatchT;
		}
		
		public function getScore()
		{
			return $this->m_score;
		}
	}
?>