-- Category: Lehreinheitsnote
SELECT
	benotungsdatum,
	lehreinheit_id,
	note
FROM
	campus.tbl_legesamtnote
WHERE
	student_uid=$uid

