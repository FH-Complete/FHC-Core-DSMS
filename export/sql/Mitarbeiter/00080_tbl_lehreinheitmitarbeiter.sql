-- Category: Lektorenzuordnung
SELECT
	tbl_studiengang.kurzbzlang,
	tbl_lehrveranstaltung.semester,
	tbl_lehrveranstaltung.bezeichnung,
	tbl_lehreinheit.lehrform_kurzbz,
	tbl_lehreinheitmitarbeiter.lehrfunktion_kurzbz,
	tbl_lehreinheitmitarbeiter.planstunden,
	tbl_lehreinheitmitarbeiter.semesterstunden,
	tbl_lehreinheitmitarbeiter.stundensatz,
	tbl_lehreinheitmitarbeiter.vertrag_id
FROM
	lehre.tbl_lehreinheitmitarbeiter
	JOIN lehre.tbl_lehreinheit USING(lehreinheit_id)
	JOIN lehre.tbl_lehrveranstaltung USING(lehrveranstaltung_id)
	JOIN public.tbl_studiengang USING(studiengang_kz)
WHERE
	mitarbeiter_uid=$uid
