-- Category: Prüfungsanmeldung
SELECT
	tbl_pruefungsanmeldung.kommentar,
	tbl_pruefungsanmeldung.lehrveranstaltung_id,
	tbl_pruefungsanmeldung.pruefungstyp_kurzbz,
	tbl_pruefungsanmeldung.reihung,
	tbl_pruefungsanmeldung.status_kurzbz,
	tbl_pruefungsanmeldung.wuensche,
	tbl_pruefung.titel,
	tbl_pruefungstermin.von as "Datum"
FROM
	campus.tbl_pruefungsanmeldung
	JOIN campus.tbl_pruefungstermin USING(pruefungstermin_id)
	JOIN campus.tbl_pruefung USING(pruefung_id)
WHERE
	uid=$uid
