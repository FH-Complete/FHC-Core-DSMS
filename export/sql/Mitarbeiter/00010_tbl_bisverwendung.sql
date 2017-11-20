-- Category: Verwendung
SELECT
	(SELECT ba1kurzbz FROM bis.tbl_beschaeftigungsart1 WHERE ba1code=tbl_bisverwendung.ba1code) as "Beschaeftigungsart1",
	(SELECT ba2bez FROM bis.tbl_beschaeftigungsart2 WHERE ba2code=tbl_bisverwendung.ba2code) as "Beschaeftigungsart2",
	(SELECT beschausmassbez FROM bis.tbl_beschaeftigungsausmass WHERE beschausmasscode=tbl_bisverwendung.beschausmasscode) as "Beschaeftigungsausmass",
	beginn,
	ende,
	habilitation,
	(SELECT bezeichnung FROM bis.tbl_hauptberuf WHERE hauptberufcode=tbl_bisverwendung.hauptberufcode) as "Hauptberuf",
	hauptberuflich "Hauptberuflich Lehrend",
	inkludierte_lehre,
	vertragsstunden,
	(SELECT verwendungbez FROM bis.tbl_verwendung WHERE verwendung_code=tbl_bisverwendung.verwendung_code) as "Verwendung",
	dv_art,
	(
	SELECT
		array_agg(
			(SELECT kurzbzlang FROM public.tbl_studiengang WHERE studiengang_kz=tbl_bisfunktion.studiengang_kz)
			|| ':' ||
			tbl_bisfunktion.sws )
	FROM
		bis.tbl_bisfunktion
	WHERE
		tbl_bisverwendung.bisverwendung_id=tbl_bisfunktion.bisverwendung_id
	) AS "SWS pro Stg"
FROM
	bis.tbl_bisverwendung
WHERE
	mitarbeiter_uid=$uid
