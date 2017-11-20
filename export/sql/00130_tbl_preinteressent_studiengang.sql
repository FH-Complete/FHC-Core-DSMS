-- Category: Interessent Studiengang
SELECT
	(SELECT kurzbzlang FROM public.tbl_studiengang WHERE studiengang_kz=tbl_preinteressentstudiengang.studiengang_kz) as "Studiengang",
	tbl_preinteressentstudiengang.freigabedatum,
	tbl_preinteressentstudiengang.uebernahmedatum,
	tbl_preinteressentstudiengang.prioritaet
FROM
	public.tbl_preinteressentstudiengang
	JOIN public.tbl_preinteressent USING(preinteressent_id)
WHERE
	person_id=$person_id
	

