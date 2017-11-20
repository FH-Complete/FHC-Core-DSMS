<?php
foreach ($dataset as $element)
{

	if (isset($element['result']))
	{
		$result = $element['result'];

		$cnt = count($result->result_array());
		if ($cnt>0)
		{
			if ($cnt>3)
			{
				// if there are more than 3 entries - make a table
				$this->load->view('extensions/dsms/ExportDataTable',
					array('result' => $result, 'category' => $element['category']));
			}
			else
			{
				// else print it as a List
				$this->load->view('extensions/dsms/ExportDataList',
					array('result' => $result, 'category' => $element['category']));
			}
			echo '<br><br>';
		}
	}
}
?>
