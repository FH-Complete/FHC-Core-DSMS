-- Category: Zeitwunsch
SELECT
	tag,
	stunde,
	gewicht
FROM
	campus.tbl_zeitwunsch
WHERE
	mitarbeiter_uid=$uid
ORDER BY
	tag, stunde
