<?php
$this->load->view('templates/header', array('title' => 'Datenexport','tablesort' => true));
?>
<body>
<h1>Datenexport</h1>
<h2>Personendaten</h2>
<?php
$this->load->view('extensions/dsms/ExportDataObject', array('dataset' => $dataset['person']));

if (isset($dataset['prestudent']) && is_array($dataset['prestudent']))
{
	foreach ($dataset['prestudent'] as $prestudent_id => $dataset_prestudent)
	{
		echo "<h2>Prestudent ".$prestudent_id."</h2>";
		$this->load->view('extensions/dsms/ExportDataObject', array('dataset' => $dataset_prestudent));

		if(isset($dataset['student'][$prestudent_id]))
		{
			$this->load->view('extensions/dsms/ExportDataObject', array('dataset' => $dataset['student'][$prestudent_id]));
			$uid = $dataset['student'][$prestudent_id]['uid'];
			echo "<h2>Benutzer ".$uid."</h2>";
			$this->load->view('extensions/dsms/ExportDataObject', array('dataset' => $dataset['benutzer'][$uid]));
		}

	}
}

foreach($dataset['mitarbeiter'] as $uid => $row_mitarbeiter)
{
	echo "<h2>Mitarbeiter ".$uid."</h2>";
	$this->load->view('extensions/dsms/ExportDataObject', array('dataset' => $row_mitarbeiter));
	$this->load->view('extensions/dsms/ExportDataObject', array('dataset' => $dataset['benutzer'][$uid]));
}

$this->load->view('templates/footer');
?>
