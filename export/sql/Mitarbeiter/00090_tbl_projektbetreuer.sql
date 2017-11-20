-- Category: Projektarbeitsbetreuung
SELECT
	tbl_projektarbeit.titel as "Projektarbeitstitel",
	tbl_projektbetreuer.betreuerart_kurzbz,
	tbl_projektbetreuer.faktor,
	tbl_projektbetreuer.name,
	tbl_projektbetreuer.note,
	tbl_projektbetreuer.punkte,
	tbl_projektbetreuer.stunden,
	tbl_projektbetreuer.stundensatz
FROM
	lehre.tbl_projektbetreuer
	JOIN lehre.tbl_projektarbeit USING(projektarbeit_id)
WHERE
	person_id=$person_id
