<?php
$this->load->view('templates/FHC-Header', array(
	'title' => 'Datenexport',
	'jquery' => true,
	'jqueryui' => true,
	'bootstrap' => true,
	'fontawesome' => true,
	'ajaxlib' => true,
	'navigationwidget' => true,
	'sbadmintemplate' => true));
?>
<body>
<script>
$(document).ready(function()
{
	$("#export_submit").prop("disabled",true);
	$("#document_submit").prop("disabled",true);
	$("#exportform").hide();

	$("#person_autocomplete").autocomplete({
		source: "<?php echo site_url('extensions/FHC-Core-DSMS/export/searchPerson') ?>",
		minLength:2,
		response: function(event, ui)
		{
			//Value und Label fuer die Anzeige setzen
			for(i in ui.content)
			{
				ui.content[i].value = ui.content[i].vorname+' '+ui.content[i].nachname+'('+ui.content[i].person_id+')';
				ui.content[i].label = ui.content[i].vorname+' '+ui.content[i].nachname+'('+ui.content[i].person_id+')';
			}
		},
		select: function(event, ui)
		{
			$("#person_id_export").val(ui.item.person_id);
			$("#person_id_documents").val(ui.item.person_id);
			$("#export_submit").prop("disabled",false);
			$("#document_submit").prop("disabled",false);
			$("#nametag").html(ui.item.vorname+' '+ui.item.nachname);
			$("#exportform").show();
		}
	});
});
</script>
<div id="wrapper">
	<?php
	echo $this->widgetlib->widget('NavigationWidget');
	?>
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

</body>
<?php
$this->load->view('templates/FHC-Footer');
?>
