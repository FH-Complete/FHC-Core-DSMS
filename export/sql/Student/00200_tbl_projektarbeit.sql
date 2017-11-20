-- Category: Projektarbeit
SELECT
	tbl_lehrveranstaltung.bezeichnung as "Lehrveranstaltung",
	tbl_projektarbeit.themenbereich,
	tbl_projektarbeit.titel,
	tbl_projektarbeit.titel_english,
	tbl_projektarbeit.beginn,
	tbl_projektarbeit.ende,
	tbl_projektarbeit.abgabedatum,
	tbl_projektarbeit.anmerkung,
	(SELECT name FROM public.tbl_firma WHERE firma_id=tbl_projektarbeit.firma_id) as "Firma",
	tbl_projektarbeit.gesperrtbis,
	tbl_projektarbeit.punkte,
	tbl_projektarbeit.note,
	tbl_projektarbeit.projekttyp_kurzbz,
	tbl_projektarbeit.abstract,
	tbl_projektarbeit.abstract_en,
	tbl_projektarbeit.schlagwoerter,
	tbl_projektarbeit.schlagwoerter_en,
	tbl_projektarbeit.seitenanzahl,
	tbl_projektarbeit.sprache,
	tbl_projektarbeit.kontrollschlagwoerter
FROM
	lehre.tbl_projektarbeit
	JOIN lehre.tbl_lehreinheit USING(lehreinheit_id)
	JOIN lehre.tbl_lehrveranstaltung USING(lehrveranstaltung_id)
WHERE
	student_uid=$uid
