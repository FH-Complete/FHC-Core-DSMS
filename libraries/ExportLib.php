<?php

if (! defined('BASEPATH')) exit('No direct script access allowed');

class ExportLib
{
	const SQL_EXPORT_DIRECTORY = FHCPATH.'application/extensions/dsms/export/sql';

	public function __construct()
	{
		// Gets CI instance
		$this->ci =& get_instance();
		$this->ci->load->model("person/Benutzer_model", "BenutzerModel");
		$this->ci->load->model("crm/Student_model", "StudentModel");
		$this->ci->load->model("crm/Prestudent_model", "PrestudentModel");
		$this->ci->load->model("ressource/Mitarbeiter_model", "MitarbeiterModel");
	}

	/**
	 * Read the Personal Data and Export it as HTML
	 * @param $person_id ID of the Person to export
	 */
	public function export($person_id)
	{
		$dataset = array();

		// Load Person Data
		$result_arr = $this->getExportData(ExportLib::SQL_EXPORT_DIRECTORY, array('person_id' => $person_id));
		$dataset['person'] = $result_arr;

		$benutzer = $this->ci->BenutzerModel->loadWhere('person_id='.$person_id);

		if (isSuccess($benutzer))
		{
			if (hasData($benutzer))
			{
				foreach ($benutzer->retval as $row_benutzer)
				{
					// load User Data
					$result_arr = $this->getExportData(
						ExportLib::SQL_EXPORT_DIRECTORY.'/Benutzer',
						array('person_id' => $person_id, 'uid' => $row_benutzer->uid));

					$dataset['benutzer'][$row_benutzer->uid] = $result_arr;

					// load Employee Data
					$mitarbeiter = $this->ci->MitarbeiterModel->loadWhere(
							"mitarbeiter_uid=".$this->ci->db->escape($row_benutzer->uid));
					if (isSuccess($mitarbeiter))
					{
						if (hasData($mitarbeiter))
						{
							$result_arr = $this->getExportData(
								ExportLib::SQL_EXPORT_DIRECTORY.'/Mitarbeiter',
								array('person_id' => $person_id, 'uid' => $row_benutzer->uid));

							$dataset['mitarbeiter'][$row_benutzer->uid] = $result_arr;
						}
					}
					else
					{
						show_error($mitarbeiter->retval);
					}

					// load Student Data
					$student = $this->ci->StudentModel->loadWhere(
						"student_uid=".$this->ci->db->escape($row_benutzer->uid));
					if (isSuccess($student))
					{
						if (hasData($student))
						{
							$prestudent_id = $student->retval[0]->prestudent_id;
							$result_arr = $this->getExportData(
								ExportLib::SQL_EXPORT_DIRECTORY.'/Student',
								array('person_id' => $person_id,
									'uid' => $row_benutzer->uid,
									'prestudent_id' => $prestudent_id));

							$dataset['student'][$prestudent_id] = array(
									'uid' => $row_benutzer->uid,
									'prestudent_id' => $prestudent_id,
									'result' => $result_arr);
						}
					}
					else
					{
						show_error($student->retval);
					}
				}
			}

			// load Prestudent Data
			$this->ci->PrestudentModel->resetQuery();
			$prestudent = $this->ci->PrestudentModel->loadWhere("person_id=".$this->ci->db->escape($person_id));
			if (hasData($prestudent))
			{
				foreach ($prestudent->retval as $row_prestudent)
				{
					$prestudent_id = $row_prestudent->prestudent_id;
					$result_arr = $this->getExportData(
						ExportLib::SQL_EXPORT_DIRECTORY.'/Prestudent',
						array('person_id' => $person_id, 'prestudent_id' => $prestudent_id));
					$dataset['prestudent'][$prestudent_id] = $result_arr;
				}
			}
			else
			{
				if (!isSuccess($prestudent))
				{
					show_error($prestudent->retval);
				}
			}

			$this->ci->load->view('extensions/dsms/ExportData',array('dataset' => $dataset));
		}
		else
		{
			show_error($student->benutzer);
		}
	}

	/**
	 * Reads the SQL Folder, Replace the Variables ($person_id, $uid, $prestudent_id)
	 * and execute the SQL and returns the Result
	 * Reads the Category Name from the SQL Comments
	 *
	 * @param $dir Directory of the SQLs
	 * @param $param List of Variables that are replaces in the SQLS
	 * @return array with the result objects
	 */
	public function getExportData($dir, $param)
	{
		$result_arr = array();

		if (($files = glob($dir.'/*.sql')) != false)
		{
			foreach ($files as $file)
			{
				$sql = file_get_contents($file);

				// Substitute parameter
				foreach ($param as $key=>$value)
					$sql = str_replace('$'.$key, $this->ci->db->escape($value), $sql);

				// parse Category
				preg_match('/-- Category: (?P<name>[\w ]*)/', $sql, $category);

				if (isset($category['name']))
					$cat = $category['name'];
				else
					$cat = 'Unknown Category';

				$result = $this->ci->db->query($sql);
				$result_arr[] = array('file' => $file, 'category' => $cat, 'result' => $result);
			}
		}
		return $result_arr;
	}
}
