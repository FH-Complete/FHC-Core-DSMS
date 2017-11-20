-- Category: Coodle Teilnehmer
SELECT
	(SELECT titel FROM campus.tbl_coodle WHERE coodle_id=tbl_coodle_ressource.coodle_id) as "Umfragetitel",
	email,
	name,
	ort_kurzbz,
	uid,
	zugangscode
FROM
	campus.tbl_coodle_ressource
WHERE
	uid=$uid
