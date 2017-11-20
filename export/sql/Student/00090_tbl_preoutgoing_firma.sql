-- Category: Outgoing Mobilität
SELECT
	(SELECT name FROM public.tbl_firma WHERE firma_id=tbl_preoutgoing_firma.firma_id) as "Hochschule",
	(SELECT beschreibung FROM bis.tbl_mobilitaetsprogramm WHERE mobilitaetsprogramm_code=tbl_preoutgoing_firma.mobilitaetsprogramm_code) as "Mobilitätsprogramm",
	tbl_preoutgoing_firma.auswahl,
	tbl_preoutgoing_firma.name 
FROM
	public.tbl_preoutgoing_firma
	JOIN public.tbl_preoutgoing USING(preoutgoing_id)
WHERE
	tbl_preoutgoing.uid=$uid

