-- Category: Outgoing Status
SELECT
	tbl_preoutgoing_preoutgoing_status.datum,
	tbl_preoutgoing_preoutgoing_status.preoutgoing_status_kurzbz as "Status"
FROM
	public.tbl_preoutgoing_preoutgoing_status
	JOIN public.tbl_preoutgoing USING(preoutgoing_id)
WHERE
	uid=$uid
