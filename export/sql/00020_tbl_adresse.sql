-- Category: Adresse
SELECT
	adresse_id,
	anmerkung,
	gemeinde,
	heimatadresse,
	name,
	nation,
	ort,
	plz,
	rechnungsadresse,
	strasse,
	typ,
	zustelladresse
FROM
	public.tbl_adresse
WHERE
	person_id=$person_id
