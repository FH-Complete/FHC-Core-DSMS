-- Category: Prüfungen
SELECT
	tbl_lehrveranstaltung.bezeichnung,
	tbl_pruefung.pruefungstyp_kurzbz,
	tbl_pruefung.anmerkung,
	tbl_pruefung.datum,
	tbl_pruefung.note,
	tbl_pruefung.punkte
FROM
	lehre.tbl_pruefung
	JOIN lehre.tbl_lehreinheit USING(lehreinheit_id)
	JOIN lehre.tbl_lehrveranstaltung USING(lehrveranstaltung_id)
WHERE
	student_uid=$uid
