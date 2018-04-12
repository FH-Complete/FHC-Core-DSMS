<?php
$this->load->view('templates/FHC-Header', array(
	'title' => 'Datenexport',
	'jquery' => true,
	'jqueryui' => true,
	'bootstrap' => true,
	'fontawesome' => true,
	'sbadmintemplate' => true));
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
			<br>Letzte Anonymisierung: <?php echo $data->last_execute;?>
			<br>zu Anonymisierende Datensätze: <?php echo $anzahl;?>
		</div>
	</div>
</div>

<script>
	//javascript hacks for bootstrap
	$("select").addClass("form-control");
	$("input[type=text]").addClass("form-control");
	$("input[type=button]").addClass("btn btn-default");
	$("#tableDataset").addClass('table-bordered');
</script>
</body>
<?php
$this->load->view('templates/FHC-Footer');
?>
