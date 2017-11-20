-- Category: Outgoing Lehrveranstaltungen
SELECT
	bezeichnung,
	ects,
	endversion,
	unitcode,
	wochenstunden
FROM
	public.tbl_preoutgoing_lehrveranstaltung
	JOIN public.tbl_preoutgoing USING(preoutgoing_id)
WHERE
	uid=$uid

