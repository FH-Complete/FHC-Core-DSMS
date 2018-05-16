<?php

if (! defined('BASEPATH')) exit('No direct script access allowed');

class DocumentExportLib
{
	/**
	 * Constructor
	 */
	public function __construct()
	{
		// Gets CI instance
		$this->ci =& get_instance();
		$this->ci->load->library('FilesystemLib');
		$this->ci->load->library('DocumentLib');
		$this->ci->load->library('DmsLib');
		$this->ci->load->model("crm/Akte_model", "AkteModel");
	}

	/**
	 * Export the Documents of a Person
	 * @param int $person_id ID of the Person to export.
	 * @param boolean $dryrun when true only tries to convert the files without sending the file
	 * @return void
	 */
	public function exportDocument($person_id, $dryrun = false)
	{
		$akten = $this->ci->AkteModel->loadWhere('person_id='.$this->ci->db->escape($person_id));

		// create Temporary Folder
		$tempdir = sys_get_temp_dir().'/FHC_'.uniqid();
		if (!mkdir($tempdir))
			show_error('Failed to Create Tempdir');
		$file_arr = array();
		$filestoclean = array();
		$files_skipped = array();

		if (hasData($akten))
		{
			foreach ($akten->retval as $akte)
			{
				$filename = 'FHC_'.uniqid();
				$content = $this->ci->dmslib->getAkteContent($akte->akte_id);

				if (isSuccess($content))
				{
					if ($this->ci->filesystemlib->write($tempdir, $filename, $content->retval) === true)
					{
						$filestoclean[] = $filename;
					}
					else
					{
						show_error('Failed to write Tempfile');
					}
				}
				else
				{
					continue;
				}

				$outFile = $this->ci->documentlib->convertToPDF($tempdir.'/'.$filename);
				if (isSuccess($outFile))
				{
					$filestoclean[] = $filename;
					$file_arr[] = $outFile->retval;
				}
				else
				{
					$filestoclean[] = $filename;
					$files_skipped[] = array(
						'akte_id' => $akte->akte_id,
						'dokumenttyp_kurzbz' => $akte->dokument_kurzbz,
						'bezeichnung' => $akte->bezeichnung,
						'mimetype' => $akte->mimetype
					);
				}
			}

			if(!$dryrun)
			{
				$finaldocument = $tempdir.'/out.pdf';
				// Merge all Documents
				$ret = $this->ci->documentlib->mergePDF($file_arr, $finaldocument);
				if (isSuccess($ret))
				{
					$filestoclean[] = 'out.pdf';

					$fsize = filesize($finaldocument);
					header('Content-type: application/pdf');
					header('Content-Disposition: attachment; filename="Dokumentenakt.pdf"');
					header('Content-Length: '.$fsize);

					// Output final Document
					echo file_get_contents($finaldocument);
				}
				else
				{
					show_error($ret->retval);
				}
			}
			else
			{
				if (count($files_skipped) > 0)
					return error($files_skipped);
				else
					return success(true);
			}
		}
		elseif (!isSuccess($akten))
		{
			show_error($akten->retval);
		}
		$this->_cleanup($tempdir, $filestoclean);
	}

	/**
	 * Removes Temporary Files after Document creation
	 * @param string $tempdir Temp Directory where the documents are located.
	 * @param array $filestoclean List of Files that should be removed.
	 * @return bool true if ok, false if error
	 */
	private function _cleanup($tempdir, $filestoclean)
	{
		$filestoclean = array_unique($filestoclean);
		foreach ($filestoclean as $file)
		{
			if(file_exists($tempdir.'/'.$file))
				unlink($tempdir.'/'.$file);
		}
		return rmdir($tempdir);
	}
}
