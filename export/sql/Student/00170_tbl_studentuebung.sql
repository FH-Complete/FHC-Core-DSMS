-- Category: Kreuzerlübung
SELECT
	tbl_uebung.bezeichnung,
	tbl_studentuebung.anmerkung,
	tbl_studentuebung.benotungsdatum,
	tbl_studentuebung.mitarbeitspunkte,
	tbl_studentuebung.note,
	tbl_studentuebung.punkte
FROM
	campus.tbl_studentuebung
	JOIN campus.tbl_uebung USING(uebung_id)
WHERE
	student_uid=$uid
