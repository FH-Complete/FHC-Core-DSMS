-- Category: Zeitwunsch
SELECT
	gewicht,
	stunde,
	tag
FROM
	campus.tbl_zeitwunsch
WHERE
	mitarbeiter_uid=$uid
