-- Category: Konto-Buchung
SELECT
	tbl_konto.buchungstext,
	tbl_konto.buchungstyp_kurzbz,
	tbl_konto.studiensemester_kurzbz as "StSem",
	tbl_konto.betrag,
	tbl_konto.buchungsdatum,
	tbl_konto.credit_points,
	tbl_konto.mahnspanne,
	tbl_studiengang.kurzbzlang,
	tbl_konto.anmerkung,
	tbl_konto.zahlungsreferenz
FROM
	public.tbl_konto
	LEFT JOIN public.tbl_studiengang USING(studiengang_kz)
WHERE
	person_id=$person_id
