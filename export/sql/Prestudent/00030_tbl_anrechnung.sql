-- Category: Anrechnungen
SELECT
	tbl_anrechnung_begruendung.bezeichnung,
	lv.bezeichnung as "Lehrveranstaltung",
	kompatibel.bezeichnung as "Kompatible LV"
FROM
	lehre.tbl_anrechnung
	LEFT JOIN lehre.tbl_anrechnung_begruendung USING(begruendung_id)
	LEFT JOIN lehre.tbl_lehrveranstaltung as lv USING(lehrveranstaltung_id)
	LEFT JOIN lehre.tbl_lehrveranstaltung as kompatibel ON(kompatibel.lehrveranstaltung_id=tbl_anrechnung.lehrveranstaltung_id_kompatibel)
WHERE
	prestudent_id=$prestudent_id
