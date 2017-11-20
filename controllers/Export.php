<?php
if (! defined('BASEPATH')) exit('No direct script access allowed');

class Export extends FHC_Controller
{
	public function __construct()
	{
		parent::__construct();
	}

	/**
	 * Displays Form for choosing Persons
	 */
	public function index()
	{
		$this->load->view('extensions/dsms/ExportIndex');
	}

	/**
	 * Creates the HTML Export of Personal Data
	 * @param person_id GET Parameter
	 */
	public function export()
	{
		$person_id = $this->input->get('person_id');
		$this->load->library('extensions/dsms/ExportLib');
		$this->exportlib->export($person_id);
	}

	/**
	 * Autocomplete search
	 * @param term GET Parameter
	 * @return json Data
	 */
	public function SearchPerson()
	{
		$filter = mb_strtolower($this->input->get('term'));

		$this->load->model("person/person_model","PersonModel");
		$result = $this->PersonModel->searchPerson($filter);
		if (isSuccess($result))
			echo json_encode($result->retval);
		else
			echo json_encode(null);
	}
}
