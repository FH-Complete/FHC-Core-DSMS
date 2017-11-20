-- Category: Funktionen
SELECT
	funktion_kurzbz,
	bezeichnung,
	datum_von,
	datum_bis,
	fachbereich_kurzbz,
	oe_kurzbz,
	semester,
	uid,
	wochenstunden
FROM
	public.tbl_benutzerfunktion
WHERE
	uid=$uid

