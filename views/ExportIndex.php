<?php
$includesArray = array(
	'title' => 'Datenexport',
	'jquery3' => true,
	'jqueryui1' => true,
	'bootstrap3' => true,
	'fontawesome4' => true,
	'ajaxlib' => true,
	'navigationwidget' => true,
	'sbadmintemplate3' => true,
	'customJSs' => array(
        'public/extensions/FHC-Core-DSMS/js/Export.js'
        )
    );
$this->load->view('templates/FHC-Header', $includesArray);
?>
<div id="wrapper">
	<?php echo $this->widgetlib->widget('NavigationWidget'); ?>
	<div id="page-wrapper">
		<div class="container-fluid">
			<div class="row">
				<div class="col-lg-12">
					<h3 class="page-header">Export</h3>
				</div>
			</div>
			Auf dieser Seite können sie die persönlichen Daten einzelner Personen exportieren.<br>
			Geben Sie in das Suchfeld Nachname und Vorname der Person ein und wählen Sie die zu exportierende Person
			<br><input type="text" id="person_autocomplete" class="form-control"/>
			<br>
			<br>
			<div id="exportform">
				<h2>Datenexport für <span id="nametag"></span></h2>
				Klicken Sie hier im die gespeicherten Daten der gewählten Person zu exportieren:
				<form method="GET" action="<?php echo site_url('extensions/FHC-Core-DSMS/export/export'); ?>" target="_blank">
					<input type="hidden" name="person_id" id="person_id_export" />
					<input type="submit" value="Daten exportieren" id="export_submit" class="btn btn-default"/>
				</form>
				<br><br>

				Klicken Sie hier um die gespeicherten Dokumente der gewählten Person zu exportieren:
				<form method="GET" action="<?php echo site_url('extensions/FHC-Core-DSMS/export/exportDocuments'); ?>">
					<input type="hidden" name="person_id" id="person_id_documents" />
					<input type="submit" value="Dokumente exportieren" id="document_submit" class="btn btn-default"/>
				</form>
			</div>
		</div>
	</div>
</div>

<?php
$this->load->view('templates/FHC-Footer', $includesArray);
?>
