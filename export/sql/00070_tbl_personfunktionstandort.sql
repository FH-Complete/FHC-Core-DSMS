-- Category: Firmen Funktion
SELECT
	position,
	anrede,
	funktion_kurzbz,
	person_id,
	(SELECT name FROM public.tbl_firma JOIN public.tbl_standort USING(firma_id) WHERE standort_id=tbl_personfunktionstandort.standort_id) as "Firma"
FROM
	public.tbl_personfunktionstandort
WHERE
	person_id=$person_id

