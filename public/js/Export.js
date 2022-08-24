$(document).ready(function()
{
	$("#export_submit").prop("disabled",true);
	$("#document_submit").prop("disabled",true);
	$("#exportform").hide();

	$("#person_autocomplete").autocomplete({
		source: FHC_JS_DATA_STORAGE_OBJECT.app_root + FHC_JS_DATA_STORAGE_OBJECT.ci_router + '/extensions/FHC-Core-DSMS/export/searchPerson',
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
