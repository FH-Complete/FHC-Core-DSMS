-- Category: Lehrveranstaltungsnote
SELECT
	bemerkung,
	benotungsdatum,
	(SELECT bezeichnung FROM lehre.tbl_lehrveranstaltung WHERE lehrveranstaltung_id=tbl_lvgesamtnote.lehrveranstaltung_id) as "Lehrveranstaltung",
	note,
	punkte,
	studiensemester_kurzbz
FROM
	campus.tbl_lvgesamtnote
WHERE
	student_uid=$uid
