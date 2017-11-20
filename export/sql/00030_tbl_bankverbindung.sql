-- Category: Bankverbindung
SELECT
	anschrift,
	bic,
	blz,
	iban,
	kontonr,
	name,
	oe_kurzbz,
	typ,
	verrechnung
FROM
	public.tbl_bankverbindung
WHERE
	person_id=$person_id
