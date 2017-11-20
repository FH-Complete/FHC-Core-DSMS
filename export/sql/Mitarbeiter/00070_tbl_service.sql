-- Category: Servicezuordnung
SELECT
	beschreibung,
	bezeichnung,
	betrieb_uid,
	design_uid,
	operativ_uid,
	oe_kurzbz
FROM
	public.tbl_service
WHERE
	operativ_uid=$uid OR design_uid=$uid OR betrieb_uid=$uid
