-- Category: Bestaetigte Ampeln
SELECT
	(SELECT kurzbz FROM public.tbl_ampel WHERE ampel_id=tbl_ampel_benutzer_bestaetigt.ampel_id) as "Bezeichnung",
	insertamum as "Bestätigungsdatum"
FROM
	tbl_ampel_benutzer_bestaetigt
WHERE
	uid=$uid

