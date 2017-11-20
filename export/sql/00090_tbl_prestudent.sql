-- Category: Prestudent
SELECT
	person_id,
	prestudent_id,
	(SELECT kurzbzlang FROM public.tbl_studiengang WHERE studiengang_kz=tbl_prestudent.studiengang_kz) as "Studiengang",
	anmerkung,
	(SELECT beschreibung FROM public.tbl_aufmerksamdurch WHERE aufmerksamdurch_kurzbz=tbl_prestudent.aufmerksamdurch_kurzbz) as "Aufmerksam Durch",
	aufnahmegruppe_kurzbz,
	(SELECT ausbildungbez FROM bis.tbl_ausbildung WHERE ausbildungcode=tbl_prestudent.ausbildungcode) as "Letzte Abgeschlossene Ausbildung",
	(SELECT berufstaetigkeit_bez FROM bis.tbl_berufstaetigkeit WHERE berufstaetigkeit_code=tbl_prestudent.berufstaetigkeit_code) as "Berufstätigkeit", 
	bismelden,
	dual,
	facheinschlberuf as "Facheinschlägig berufstätig",
	gsstudientyp_kurzbz,
	mentor,
	reihungstestangetreten,
	rt_gesamtpunkte,
	udf_values as "Zusatzfelder",

	(SELECT zgv_kurzbz FROM bis.tbl_zgv WHERE zgv_code=tbl_prestudent.zgv_code) as "Zugangsvoraussetzung", 
	zgvdatum as "Datum der Zugangsvoraussetzung",
	zgvnation as "Nation der Zugangsvoraussetzung",
	zgvort as "Ort der Zugangsvoraussetzung",

	(SELECT zgvmas_kurzbz FROM bis.tbl_zgvmaster WHERE zgvmas_code=tbl_prestudent.zgvmas_code) as "Zugangsvoraussetzung Master",
	zgvmadatum as "Datum der Zugangsvoraussetzung Master",
	zgvmanation as "Nation der Zugangsvoraussetzung Master",
	zgvmaort as "Ort der Zugangsvoraussetzung Master",

	(SELECT zgvdoktor_kurzbz FROM bis.tbl_zgvdoktor WHERE zgvdoktor_code=tbl_prestudent.zgvdoktor_code) as "Zugangsvoraussetzung Doktor",
	zgvdoktordatum as "Datum der Zugangsvoraussetzung Doktor",
	zgvdoktornation as "Nation der Zugangsvoraussetzung Doktor",
	zgvdoktorort as "Ort der Zugangsvoraussetzung Doktor"

FROM
	public.tbl_prestudent
WHERE
	person_id=$person_id
