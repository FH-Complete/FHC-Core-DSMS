<?php
$this->load->view('templates/FHC-Header', array(
	'title' => 'Datenexport',
	'jquery3' => true,
	'jqueryui1' => true,
	'bootstrap3' => true,
	'fontawesome4' => true,
	'ajaxlib' => true,
	'navigationwidget' => true,
	'sbadmintemplate3' => true));

$this->load->helper('date');
?>
<body>
<div id="wrapper">
	<?php

	echo $this->widgetlib->widget('NavigationWidget');
	?>
	<div id="page-wrapper">
		<div class="container-fluid">
			<div class="row">
				<div class="col-lg-12">
					<h3 class="page-header">Details - Anonymisierung</h3>
				</div>
			</div>
			<h1><?php echo $anonymisierung_kurzbz; ?></h1>
			<div>
				<?php echo $data->beschreibung; ?>
			</div>
			<br>Letzte Anonymisierung: <?php echo nice_date($data->last_execute,'d.m.Y H:i');?>
			<br>zu Anonymisierende Datensätze: <?php echo $anzahl;?>
			<br>
			<br>
			<form method="POST" action="<?php echo site_url('extensions/FHC-Core-DSMS/Export/Anonymize');?>">
				<input type="hidden" name="anonymisierung_kurzbz" value="<?php echo $anonymisierung_kurzbz; ?>" />
				<input type="submit" value="Anonymisierung starten" class="btn btn-default">
			</form>
		</div>
	</div>
</div>
</body>
<?php
$this->load->view('templates/FHC-Footer');
?>
