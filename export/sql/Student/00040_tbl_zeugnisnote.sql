-- Category: Zeugnisnoten
SELECT
	tbl_lehrveranstaltung.bezeichnung,
	tbl_zeugnisnote.bemerkung,
	tbl_zeugnisnote.benotungsdatum,
	tbl_zeugnisnote.note,
	tbl_zeugnisnote.punkte,
	tbl_zeugnisnote.studiensemester_kurzbz,
	tbl_zeugnisnote.uebernahmedatum
FROM
	lehre.tbl_zeugnisnote
	JOIN lehre.tbl_lehrveranstaltung USING(lehrveranstaltung_id)
WHERE
	student_uid=$uid
