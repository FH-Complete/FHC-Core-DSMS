-- Category: Kontakt
SELECT
	anmerkung,
	kontakt,
	kontakt_id,
	kontakttyp,
	zustellung
FROM
	public.tbl_kontakt
WHERE
	person_id=$person_id

