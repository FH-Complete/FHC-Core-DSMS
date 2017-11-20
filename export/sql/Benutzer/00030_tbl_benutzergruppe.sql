-- Category: Gruppenzuordnung
SELECT
	gruppe_kurzbz,
	studiensemester_kurzbz 
FROM
	public.tbl_benutzergruppe
WHERE
	uid=$uid

