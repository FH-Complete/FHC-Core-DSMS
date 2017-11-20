-- Category: Benutzer
SELECT
	uid,
	aktiv,
	updateaktivam as "Deaktivierungsdatum",
	aktivierungscode,
	alias
FROM
	public.tbl_benutzer
WHERE
	person_id=$person_id

