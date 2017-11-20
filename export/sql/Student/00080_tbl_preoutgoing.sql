-- Category: Outgoing
SELECT
	dauer_von,
	dauer_bis,
	anmerkung_student as "Anmerkung",
	(SELECT vorname || ' ' || nachname FROM public.tbl_person JOIN public.tbl_benutzer USING(person_id) WHERE uid=tbl_preoutgoing.ansprechperson) as "Ansprechperson",
	bachelorarbeit,
	behinderungszuschuss,
	betreuer,
	intensivsprachkurs,
	masterarbeit,
	praktikum,
	praktikum_bis,
	praktikum_von,
	preoutgoing_id,
	projektarbeittitel,
	sprachkurs,
	sprachkurs_bis,
	sprachkurs_von,
	studienbeihilfe,
	studienrichtung_gastuniversitaet
FROM
	public.tbl_preoutgoing
WHERE
	uid=$uid
