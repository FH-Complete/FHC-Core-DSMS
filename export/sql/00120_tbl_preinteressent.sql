-- Category: Interessent
SELECT
	studiensemester_kurzbz,
	aufmerksamdurch_kurzbz,
	einverstaendnis,
	erfassungsdatum,
	firma_id,
	infozusendung,
	kontaktmedium_kurzbz,
	maturajahr,
	absagedatum,
	anmerkung
FROM
	public.tbl_preinteressent
WHERE
	person_id=$person_id

