-- Category: Kreuzerllisten
SELECT
	vorbereitet,
	probleme,
	tbl_beispiel.bezeichnung
FROM
	campus.tbl_studentbeispiel
	JOIN campus.tbl_beispiel USING(beispiel_id)
WHERE
	student_uid=$uid
