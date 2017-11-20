-- Category: Verträge
SELECT
	anmerkung,
	betrag,
	bezeichnung,
	(
	SELECT 
		tbl_studiengang.kurzbz || tbl_lehrveranstaltung.semester || tbl_lehrveranstaltung.bezeichnung as "Lehrveranstaltung"
	FROM 
		lehre.tbl_lehrveranstaltung 
		JOIN public.tbl_studiengang USING(studiengang_kz) 
	WHERE lehrveranstaltung_id=lehrveranstaltung_id
	) as "Lehrveranstaltung",
	vertragsdatum,
	vertragstyp_kurzbz
FROM
	lehre.tbl_vertrag
WHERE
	person_id=$person_id

