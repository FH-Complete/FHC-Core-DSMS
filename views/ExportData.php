<?php
$this->load->view('templates/FHC-Header', array(
	'title' => 'Datenexport',
	'jquery3' => true,
	'jqueryui1' => true,
	'tablesorter2' => true,
	'bootstrap3' => true,
	'fontawesome4' => true,
	'ajaxlib' => true,
	'navigationwidget' => true,
	'sbadmintemplate3' => true,
	'customJSs' => array(
			'public/extensions/FHC-Core-DSMS/js/Exportdata.js'
			),
	)
);
?>
<body>
<h1>Datenexport</h1>
<h2>Personendaten</h2>
<?php
$this->load->view('extensions/FHC-Core-DSMS/ExportDataObject', array('dataset' => $dataset['person']));

if (isset($dataset['prestudent']) && is_array($dataset['prestudent']))
{
	foreach ($dataset['prestudent'] as $prestudent_id => $dataset_prestudent)
	{
		echo "<h2>Prestudent ".$prestudent_id."</h2>";
		$this->load->view('extensions/FHC-Core-DSMS/ExportDataObject', array('dataset' => $dataset_prestudent));

		if (isset($dataset['student'][$prestudent_id]))
		{
			echo "<h2>Studentendaten</h2>";
			$this->load->view(
				'extensions/FHC-Core-DSMS/ExportDataObject',
				array('dataset' => $dataset['student'][$prestudent_id]['result'])
			);

			$uid = $dataset['student'][$prestudent_id]['uid'];
			echo "<h2>Benutzer ".$uid."</h2>";

			$this->load->view(
				'extensions/FHC-Core-DSMS/ExportDataObject',
				array('dataset' => $dataset['benutzer'][$uid])
			);
		}
	}
}

if (isset($dataset['mitarbeiter']))
{
	foreach ($dataset['mitarbeiter'] as $uid => $row_mitarbeiter)
	{
		echo "<h2>Mitarbeiter ".$uid."</h2>";
		$this->load->view('extensions/FHC-Core-DSMS/ExportDataObject', array('dataset' => $row_mitarbeiter));
		$this->load->view('extensions/FHC-Core-DSMS/ExportDataObject', array('dataset' => $dataset['benutzer'][$uid]));
	}
}

$this->load->view('templates/FHC-Footer');
?>
