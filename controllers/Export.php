<?php
if (! defined('BASEPATH')) exit('No direct script access allowed');

class Export extends FHC_Controller
{
	/**
	 * Constructor
	 */
	public function __construct()
	{
		parent::__construct();

		$this->load->library('PermissionLib');
		if(!$this->permissionlib->isBerechtigt('dsms/export'))
			show_error('You have no Permission! You need DSMSExport Role');
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
	 * @return void
	 */
	public function exportDocuments()
	{
		$person_id = $this->input->get('person_id');
		$this->load->library('extensions/FHC-Core-DSMS/DocumentExportLib');
		$this->documentexportlib->exportDocument($person_id);
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
}
