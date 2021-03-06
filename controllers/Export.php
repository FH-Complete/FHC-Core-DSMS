<?php
if (! defined('BASEPATH')) exit('No direct script access allowed');

class Export extends Auth_Controller
{
	/**
	 * Constructor
	 */
	public function __construct()
	{
		parent::__construct(array(
			'index'=>'dsms/export:rw',
			'export'=>'dsms/export:r',
			'exportDocuments'=>'dsms/export:r',
			'searchPerson'=>'dsms/export:r',
			'Anonymisierung'=>'dsms/export:r',
			'Details'=>'dsms/export:r',
			'Anonymize'=>'dsms/export:rw'
			)
		);
	}

	/**
	 * Displays Form for choosing Persons
	 * @return void
	 */
	public function index()
	{
		$this->load->library('WidgetLib');
		$this->load->view('extensions/FHC-Core-DSMS/ExportIndex');
	}

	/**
	 * Creates the HTML Export of Personal Data
	 * Function expects a person_id GET Parameter
	 * @return void
	 */
	public function export()
	{
		$person_id = $this->input->get('person_id');
		$this->load->library('extensions/FHC-Core-DSMS/ExportLib');
		$this->exportlib->export($person_id);
	}

	/**
	 * Export a PDF with all saved Documents of a Person
	 * Function expects a person_id GET Parameter
	 * if the GET Parameter force is set, the document is created even if there are some
	 * documents that cannot be convertet to pdf
	 * @return void
	 */
	public function exportDocuments()
	{
		$person_id = $this->input->get('person_id');
		$force = $this->input->get('force');
		$this->load->library('extensions/FHC-Core-DSMS/DocumentExportLib');
		if($force != '')
		{
			$ret = $this->documentexportlib->exportDocument($person_id);
		}
		else
		{
			// Try to generate the Document
			$ret = $this->documentexportlib->exportDocument($person_id, true);
			if(isSuccess($ret))
			{
				$this->documentexportlib->exportDocument($person_id);
			}
			else
			{
				// If there are some documents that cannot be converted to PDF
				// show a list of the problematic Documents and a button to force the download
				$this->load->library('WidgetLib');
				$this->load->view('extensions/FHC-Core-DSMS/ExportDocuments', array(
					'person_id'=>$person_id,
					'convertfailed'=>$ret->retval
				));
			}
		}
	}

	/**
	 * Autocomplete search
	 * Function expects a term GET Parameter
	 * @return void
	 */
	public function searchPerson()
	{
		$filter = mb_strtolower($this->input->get('term'));

		$this->load->model("person/person_model", "PersonModel");
		$result = $this->PersonModel->searchPerson($filter);
		if (isSuccess($result))
			echo json_encode($result->retval);
		else
			echo json_encode(null);
	}

	/**
	 * Displays an Overview over the Exisiting Anonymization Tasks
	 */
	public function Anonymisierung()
	{
		$this->load->model("extensions/FHC-Core-DSMS/Anonymisierung_model", "AnonymisierungModel");
		$this->load->library('WidgetLib');

		$result = $this->AnonymisierungModel->getActiveRecords();

		if(hasData($result))
		{
			$jobs = $result->retval;
		}
		else
		{
			$jobs = array();
		}

		$this->load->view('extensions/FHC-Core-DSMS/Anonymisierung', array('jobs'=>$jobs));
	}

	/**
	 * Displays the Details of a Anonymization Task
	 * @param $anonymisierung_kurzbz Shortname of the Task
	 */
	public function Details($anonymisierung_kurzbz)
	{
		$this->load->model("extensions/FHC-Core-DSMS/Anonymisierung_model", "AnonymisierungModel");
		$this->load->library('WidgetLib');

		$result = $this->AnonymisierungModel->load($anonymisierung_kurzbz);
		if(hasData($result))
		{
			$data = $result->retval[0];
		}
		else
		{
			show_error('No Entry found');
		}
		$anzahl = $this->AnonymisierungModel->getCount($anonymisierung_kurzbz);

		$params['anonymisierung_kurzbz'] = $anonymisierung_kurzbz;
		$params['data'] = $data;
		$params['anzahl'] = $anzahl;

		$this->load->view('extensions/FHC-Core-DSMS/AnonymisierungDetails', $params);
	}

	public function Anonymize()
	{
		$anonymisierung_kurzbz = $this->input->post('anonymisierung_kurzbz');
		if($anonymisierung_kurzbz=='')
			show_error('Parameter Missing');

		$this->load->model("extensions/FHC-Core-DSMS/Anonymisierung_model", "AnonymisierungModel");
		$this->AnonymisierungModel->runAnonymization($anonymisierung_kurzbz);
		redirect("/extensions/FHC-Core-DSMS/Export/Details/".$anonymisierung_kurzbz);
	}
}
