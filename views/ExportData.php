<?php
$this->load->view('templates/FHC-Header', array(
	'title' => 'Datenexport',
	'jquery' => true,
	'jqueryui' => true,
	'tablesorter' => true,
	'bootstrap' => true,
	'fontawesome' => true,
	'ajaxlib' => true,
	'navigationwidget' => true,
	'sbadmintemplate' => true));
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
echo '
<script language="Javascript" type="text/javascript">
		$(document).ready(function()
		{
			$(".tablesorter").tablesorter(
			{
				sortList: [[0,1]],
				widgets: ["zebra"]
			});
		});
	</script>';
$this->load->view('templates/FHC-Footer');
?>
