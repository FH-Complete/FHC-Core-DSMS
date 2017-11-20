-- Category: Berechtigungen
SELECT
	berechtigung_kurzbz,
	rolle_kurzbz,
	art,
	start,
	ende,
	studiensemester_kurzbz,
	funktion_kurzbz,
	oe_kurzbz,
	(SELECT bezeichnung FROM wawi.tbl_kostenstelle WHERE kostenstelle_id=tbl_benutzerrolle.kostenstelle_id) as "Kostenstelle",
	negativ
FROM
	system.tbl_benutzerrolle
WHERE
	uid=$uid
