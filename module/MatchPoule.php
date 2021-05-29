<?php
	class MatchPoule
	{
		private $m_idEquipe1;
		private $m_idEquipe2;
		private $m_idMatchT;
		private $m_score;
		
		public function __construct(int $idEquipe1, int $idEquipe2, int $idMatchT, int $score)
		{
			$this->m_idEquipe1 = $idEquipe1;
			$this->m_idEquipe2 = $idEquipe2;
			$this->m_idMatchT = $idMatchT;
			$this->m_score = $score;
		}
		
		public function getIdEquipe1()
		{
			return $this->m_idEquipe1;
		}
		
		public function getIdEquipe2()
		{
			return $this->m_idEquipe2;
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