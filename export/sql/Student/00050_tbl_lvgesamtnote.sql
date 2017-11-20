-- Category: Lehrveranstaltungsnote
SELECT
	(SELECT bezeichnung FROM lehre.tbl_lehrveranstaltung WHERE lehrveranstaltung_id=tbl_lvgesamtnote.lehrveranstaltung_id) as "Lehrveranstaltung",
	tbl_lvgesamtnote.bemerkung,
	tbl_lvgesamtnote.benotungsdatum,
	tbl_note.bezeichnung as "Note",
	tbl_lvgesamtnote.punkte,
	tbl_lvgesamtnote.studiensemester_kurzbz
FROM
	campus.tbl_lvgesamtnote
	LEFT JOIN lehre.tbl_note USING(note)
WHERE
	student_uid=$uid
