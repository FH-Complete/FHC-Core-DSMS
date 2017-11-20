-- Category: Zeitaufzeichnung
SELECT
	start,
	ende,
	aktivitaet_kurzbz,
	beschreibung,
	kunde_uid,
	oe_kurzbz_1,
	oe_kurzbz_2,
	projekt_kurzbz,
	service_id
FROM
	campus.tbl_zeitaufzeichnung
WHERE
	uid=$uid

