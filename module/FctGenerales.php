<?php
	function bool2SQLStr(bool $valeurBooleenne)
	{
		return (($valeurBooleenne) ? "TRUE" : "FALSE");
	}

	function estPair(int $nb)
	{
		return $nb%2==0;
	}

	function puissanceDe2(int $nb)
	{
		while(estPair($nb))
				$nb=$nb/2;
			return $nb==1;
	}

	function nbEquipesPremierTour(int $x)
	{
		$val = $x ;
		if(!estPair($val))
			--$val ;
		while( (($val/2)+($x-$val))>0  && !puissanceDe2(($val/2)+($x-$val)) )
		{
			if(!estPair($val))
				--$val ;
			else
				$val-= 2;
		}
		return $val ;
	}


?>