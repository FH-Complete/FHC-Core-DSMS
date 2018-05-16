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
					<h3 class="page-header">Export</h3>
				</div>
			</div>
			Die folgenden Dateien der Person können nicht auf PDF konvertiert werden und
			müssen separat heruntergeladen werden:
			<?php
			echo '<ul>';
			foreach($convertfailed as $row)
			{
				echo '<li>AkteID:'.$row['akte_id'].' '.$row['bezeichnung'].' (Mimetype:'.$row['mimetype'].')</li>';
			}
			echo '</ul>';
			?>
			<br />
			<br />
			Klicken Sie hier um die anderen Dokumente zu exportieren
			<form method="GET" action="<?php echo site_url('extensions/FHC-Core-DSMS/export/exportDocuments'); ?>">
				<input type="hidden" name="person_id" value="<?php echo $person_id; ?>" id="person_id_documents" />
				<input type="hidden" name="force" value="true" id="force" />
				<input type="submit" value="Dokumente exportieren" id="document_submit" class="btn btn-default"/>
			</form>
		</div>
	</div>
</div>

</body>
<?php
$this->load->view('templates/FHC-Footer');
?>
