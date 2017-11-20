<?php
$this->load->view('templates/header', array('title' => 'Datenexport', 'jqueryCurrent' => true, 'jqueryui' => true));
?>
<body>
<h1>Datenexport</h1>
<script>
$(document).ready(function()
{
	$("#person_autocomplete").autocomplete({
		source: "SearchPerson",
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
			$("#person_id").val(ui.item.person_id);
		}
	});
});
</script>

Auf dieser Seite können sie die Persönlichen Daten einzelner Personen exportieren.<br>
Suchen Sie die zu exportierende Person:<bR>
<br>
<form method="GET" action="export">
	<input type="hidden" name="person_id" id="person_id" />
	<input type="text" id="person_autocomplete" />
	<input type="submit" value="Daten exportieren"/>
</form>
</body>
<?php
$this->load->view('templates/footer');
?>
