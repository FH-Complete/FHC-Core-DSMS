-- Category: Mitarbeiter
SELECT
	tbl_mitarbeiter.mitarbeiter_uid,
	tbl_mitarbeiter.personalnummer,
	tbl_mitarbeiter.kurzbz,
	tbl_mitarbeiter.anmerkung,
	tbl_ausbildung.ausbildungbez as "Ausbildung",
	tbl_mitarbeiter.bismelden,
	tbl_mitarbeiter.fixangestellt,
	tbl_mitarbeiter.kleriker,
	tbl_mitarbeiter.lektor,
	tbl_mitarbeiter.ort_kurzbz,
	tbl_mitarbeiter.standort_id,
	tbl_mitarbeiter.stundensatz,
	tbl_mitarbeiter.telefonklappe
FROM
	public.tbl_mitarbeiter
	LEFT JOIN bis.tbl_ausbildung USING(ausbildungcode)
WHERE
	mitarbeiter_uid=$uid
