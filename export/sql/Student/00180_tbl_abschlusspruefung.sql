-- Category: Abschlussprüfung
SELECT
	abschlussbeurteilung_kurzbz,
	akadgrad_id,
	anmerkung,
	datum,
	note,
	pruefungstyp_kurzbz,
	sponsion,
	uhrzeit
FROM
	lehre.tbl_abschlusspruefung
WHERE
	prestudent_id=$prestudent_id
