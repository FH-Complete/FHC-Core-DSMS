-- Category: Feedback
SELECT
	betreff,
	datum,
	(SELECT bezeichnung FROM lehre.tbl_lehrveranstaltung WHERE lehrveranstaltung_id=tbl_feedback.lehrveranstaltung_id) as "Lehrveranstaltung",
	text
FROM
	campus.tbl_feedback
WHERE
	uid=$uid
