-- Category: Coodle Umfragen
SELECT
	titel,
	beschreibung,
	coodle_status_kurzbz,
	dauer,
	endedatum,
	ersteller_uid,
	mailversand,
	teilnehmer_anonym,
	termine_anonym
FROM
	campus.tbl_coodle
WHERE
	ersteller_uid=$uid
