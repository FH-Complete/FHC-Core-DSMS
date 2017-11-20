-- Category: Projektarbeitsabgabe
SELECT
	tbl_paabgabe.datum,
	tbl_paabgabe.fixtermin,
	tbl_paabgabe.abgabedatum,
	tbl_paabgabe.kurzbz,
	tbl_paabgabetyp.bezeichnung,
	tbl_projektarbeit.titel
FROM
	campus.tbl_paabgabe
	JOIN lehre.tbl_projektarbeit USING(projektarbeit_id)
	LEFT JOIN campus.tbl_paabgabetyp USING(paabgabetyp_kurzbz)
WHERE
	tbl_projektarbeit.student_uid=$uid
