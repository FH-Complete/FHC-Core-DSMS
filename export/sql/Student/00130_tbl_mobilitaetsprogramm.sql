-- Category: Mobilitaetsprogramm
SELECT
	(SELECT beschreibung FROM bis.tbl_mobilitaetsprogramm WHERE mobilitaetsprogramm_code=tbl_bisio.mobilitaetsprogramm_code) as "Programm",
	(SELECT bezeichnung FROM bis.tbl_zweck WHERE zweck_code=tbl_bisio.zweck_code) as "Zweck des Aufenthalts",
	von,
	bis,
	nation_code,
	ort,
	universitaet
FROM
	bis.tbl_bisio
WHERE
	prestudent_id=$prestudent_id
