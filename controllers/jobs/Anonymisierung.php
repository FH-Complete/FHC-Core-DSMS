<?php

if (! defined('BASEPATH'))
	exit('No direct script access allowed');

/**
 * Database Class
 *
 */

class Anonymisierung extends FHC_Controller
{
	/**
	 * Initialize Prestudentstatus Class
	 *
	 * @return	void
	 */
	public function __construct()
	{
		parent::__construct();

		if ($this->input->is_cli_request())
		{
			$cli = true;
		}
		else
		{
			$this->output->set_status_header(403, 'Jobs must be run from the CLI');
			echo "Jobs must be run from the CLI";
			exit;
		}
	}

	/**
	 * Main function index as help
	 *
	 * @return	void
	 */
	public function index()
	{
		$result = "The following are the available command line interface commands\n\n";
		$result .= "php index.ci.php extensions/FHC-Core-DSMS/jobs/Anonymisierung RunAll";

		echo $result.PHP_EOL;
	}

	/**
	 */
	public function runAll()
	{
		$this->load->model("extensions/FHC-Core-DSMS/Anonymisierung_model", "AnonymisierungModel");
		
		$result = $this->AnonymisierungModel->getActiveRecords();

		if(hasData($result))
		{
			$jobs = $result->retval;
		}
		else
		{
			$jobs = array();
		}

		foreach($jobs as $job)
		{
			echo 'Anonymize Task:'.$job->anonymisierung_kurzbz.' ('.$job->anzahl.' Records):';
			if($this->AnonymisierungModel->runAnonymization($job->anonymisierung_kurzbz))
				echo 'ok';
			else
				echo 'failed';
			echo "\n";

		}

	}
}
