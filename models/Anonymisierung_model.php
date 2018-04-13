<?php
class Anonymisierung_model extends DB_Model
{

	/**
	 * Constructor
	 */
	public function __construct()
	{
		parent::__construct();
		$this->dbTable = 'extension.tbl_dsms_anonymisierung';
		$this->pk = 'anonymisierung_kurzbz';
	}

	/**
	 * get all Active Anonymization Tasks
	 * Additionally it loads the Number of affected Rows
	 * @return object ob loaded Data.
	 */
	public function getActiveRecords()
	{
		$result = $this->loadWhere(array('aktiv'=>'true'));

		foreach($result->retval as $key=>$job)
		{
			if($job->anzahl_sql!='')
			{
				$result_anzahl = $this->execQuery($job->anzahl_sql);

				if(hasData($result_anzahl) && isset($result_anzahl->retval[0]->anzahl))
					$result->retval[$key]->anzahl = $result_anzahl->retval[0]->anzahl;
				else
					$result->retval[$key]->anzahl = -1;
			}
		}
		return $result;
	}

	/**
	 * get the Amount of Records that need to be Anonymized
	 * @param $anonymisierung_kurzbz string Shortname of Anonymization Dataset.
	 * @return number of records or false on error
	 */
	public function getCount($anonymisierung_kurzbz)
	{
		$result = $this->loadWhere(array('anonymisierung_kurzbz'=>$anonymisierung_kurzbz));

		if(hasData($result))
		{
			$result_anzahl = $this->execQuery($result->retval[0]->anzahl_sql);
			if(hasData($result_anzahl) && isset($result_anzahl->retval[0]->anzahl))
			{
				return $result_anzahl->retval[0]->anzahl;
			}
		}

		return false;
	}

	/**
	 * Runs the Anonymization Task
	 * @param $anonymisierung_kurzbz Short Description of the Task.
	 * @return boolean true if ok, false on error.
	 */
	public function runAnonymization($anonymisierung_kurzbz)
	{
		$result = $this->loadWhere(array('anonymisierung_kurzbz'=>$anonymisierung_kurzbz));

		if(hasData($result))
		{
			// Anonymize Data
			$result = $this->execQuery($result->retval[0]->anonymisierung_sql);
			if(isSuccess($result))
			{
				// Write last execution Date
				$resultupdate = $this->update($anonymisierung_kurzbz, array('last_execute'=>date('Y-m-d H:i:s')));
				if(isSuccess($resultupdate))
				{
					return true;
				}
				else
					show_error($resultupdate->retval);
			}
			else
				return false;
		}

		return false;
	}
}
