-- Category: Gemeinsames Studium
SELECT
	studiensemester_kurzbz,
	status_kurzbz,
	ausbildungssemester,
	(SELECT name FROM public.tbl_firma WHERE firma_id=tbl_mobilitaet.firma_id) as "Partnerhochschule",
	(SELECT bezeichnung FROM bis.tbl_gsprogramm WHERE gsprogramm_id=tbl_mobilitaet.gsprogramm_id) as "Studienprogramm",
	(SELECT beschreibung FROM bis.tbl_mobilitaetsprogramm WHERE mobilitaetsprogramm_code=tbl_mobilitaet.mobilitaetsprogramm_code) as "Mobilitaetsprogramm",
	mobilitaetstyp_kurzbz
FROM
	bis.tbl_mobilitaet
WHERE
	prestudent_id=$prestudent_id
