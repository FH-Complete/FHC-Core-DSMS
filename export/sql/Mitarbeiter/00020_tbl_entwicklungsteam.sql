-- Category: Mitglied im Entwicklungsteam
SELECT
	beginn,
	ende,
	(SELECT besqualbez FROM bis.tbl_besqual WHERE besqualcode=tbl_entwicklungsteam.besqualcode) as "Qualifikation",
	(SELECT kurzbz FROM public.tbl_studiengang WHERE studiengang_kz=tbl_entwicklungsteam.studiengang_kz) as "Studiengang"
FROM
	bis.tbl_entwicklungsteam
WHERE
	mitarbeiter_uid=$uid
