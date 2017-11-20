-- Category: Incoming
SELECT
	aktiv,
	von,
	bis,
	anmerkung,
	bachelor,
	bachelorthesis,
	code,
	deutschkurs1,
	deutschkurs2,
	deutschkurs3,
	(SELECT name FROM public.tbl_firma WHERE firma_id=tbl_preincoming.firma_id) as "Hochschule",
	jahre,
	master,
	masterthesis,
	(SELECT beschreibung FROM bis.tbl_mobilitaetsprogramm WHERE mobilitaetsprogramm_code=tbl_preincoming.mobilitaetsprogramm_code) as "Mobilitätsprogramm",
	(SELECT vorname || ' ' || nachname FROM public.tbl_person WHERE person_id=tbl_preincoming.person_id_coordinator_dep) as "Coordinator Dep.",
	(SELECT vorname || ' ' || nachname FROM public.tbl_person WHERE person_id=person_id_coordinator_int) as "Coordinator Int.",
	(SELECT vorname || ' ' || nachname FROM public.tbl_person WHERE person_id=person_id_emergency) as "Emergency Kontakt",
	program_name,
	research_area,
	uebernommen,
	universitaet,
	tbl_preincoming.zgv as "Zugangsvoraussetzung",
	zgv_datum as "Datum der Zugangsvoraussetzung",
	zgv_name as "Name der Zugangsvoraussetzung",
	zgv_ort as "Ort der Zugangsvoraussetzung",
	tbl_preincoming.zgvmaster as "Zugangsvoraussetzung Master",
	zgvmaster_datum as "Datum der Zugangsvoraussetzung Master",
	zgvmaster_name as "Name der Zugangsvoraussetzung Master",
	zgvmaster_ort as "Ort der Zugangsvoraussetzung Master",
	(SELECT bezeichnung FROM bis.tbl_zweck WHERE zweck_code=tbl_preincoming.zweck_code) as "Zweck",
	(SELECT array_agg(tbl_lehrveranstaltung.kurzbz) FROM public.tbl_preincoming_lehrveranstaltung JOIN lehre.tbl_lehrveranstaltung USING(lehrveranstaltung_id) WHERE preincoming_id=tbl_preincoming.preincoming_id) as "Lehrveranstaltungszuordnungen"
FROM
	public.tbl_preincoming
WHERE
	person_id=$person_id
