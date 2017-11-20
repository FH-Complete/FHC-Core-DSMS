-- Category: Projektarbeitsabgabe
SELECT
	tbl_paabgabe.abgabedatum,
	tbl_paabgabe.datum,
	tbl_paabgabe.fixtermin,
	tbl_paabgabe.kurzbz,
	tbl_paabgabe.paabgabetyp_kurzbz,
	tbl_projektarbeit.titel
FROM
	campus.tbl_paabgabe
	JOIN lehre.tbl_projektarbeit USING(projektarbeit_id)
WHERE
	tbl_projektarbeit.student_uid=$uid
	
