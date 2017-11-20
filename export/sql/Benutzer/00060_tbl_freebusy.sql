-- Category: FreeBusy Eintraege
SELECT
	aktiv,
	bezeichnung,
	freebusytyp_kurzbz,
	uid,
	url
FROM
	campus.tbl_freebusy
WHERE
	uid=$uid

