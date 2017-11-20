-- Category: Anwesenheit
SELECT
	datum,
	einheiten,
	anwesend,
	(SELECT kurzbz FROM lehre.tbl_lehrveranstaltung JOIN lehre.tbl_lehreinheit USING(lehrveranstaltung_id) WHERE lehreinheit_id=tbl_anwesenheit.lehreinheit_id) as Lehrveranstaltung,
	anmerkung
FROM
	campus.tbl_anwesenheit
WHERE
	uid=$uid
ORDER BY
	datum

