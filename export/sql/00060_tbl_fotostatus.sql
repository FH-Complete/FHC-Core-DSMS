-- Category: Fotostatus
SELECT
	datum,
	fotostatus_kurzbz 
FROM
	public.tbl_person_fotostatus
WHERE
	person_id=$person_id
ORDER BY datum

