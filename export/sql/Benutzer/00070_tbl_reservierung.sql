-- Category: Raumreservierungen
SELECT
	datum,
	stunde,
	ort_kurzbz,
	titel,
	beschreibung,
	studiengang_kz,
	semester,
	verband,
	gruppe,
	gruppe_kurzbz,
	uid
FROM
	campus.tbl_reservierung
WHERE
	uid=$uid
	OR gruppe_kurzbz IN(SELECT gruppe_kurzbz FROM public.tbl_benutzergruppe WHERE uid=$uid AND studiensemester_kurzbz is NULL)
