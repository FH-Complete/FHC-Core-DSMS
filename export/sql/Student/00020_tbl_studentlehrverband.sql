-- Category: Lehrverband
SELECT
	(SELECT kurzbzlang FROM public.tbl_studiengang WHERE studiengang_kz=tbl_studentlehrverband.studiengang_kz) as "Studiengang",
	studiensemester_kurzbz,
	semester,
	verband,
	gruppe
FROM
	public.tbl_studentlehrverband
WHERE
	student_uid=$uid

