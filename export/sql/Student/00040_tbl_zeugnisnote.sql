-- Category: Zeugnisnoten
SELECT
	tbl_lehrveranstaltung.bezeichnung,
	tbl_zeugnisnote.bemerkung,
	tbl_zeugnisnote.benotungsdatum,
	tbl_note.bezeichnung as "Note",
	tbl_zeugnisnote.punkte,
	tbl_zeugnisnote.studiensemester_kurzbz,
	tbl_zeugnisnote.uebernahmedatum
FROM
	lehre.tbl_zeugnisnote
	JOIN lehre.tbl_lehrveranstaltung USING(lehrveranstaltung_id)
	LEFT JOIN lehre.tbl_note USING(note)
WHERE
	student_uid=$uid
