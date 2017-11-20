-- Category: Zeitsperre
SELECT
	vondatum,
	vonstunde,	
	bisdatum,
	bisstunde,
	bezeichnung,
	erreichbarkeit_kurzbz,
	freigabeamum,
	freigabevon,
	mitarbeiter_uid,
	vertretung_uid,
	zeitsperretyp_kurzbz
FROM
	campus.tbl_zeitsperre
WHERE
	mitarbeiter_uid=$uid OR vertretung_uid=$uid OR freigabevon=$uid
