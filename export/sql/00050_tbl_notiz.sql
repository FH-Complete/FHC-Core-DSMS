-- Category: Notiz
SELECT
	titel, 
	text 
FROM
	public.tbl_notiz
WHERE 
	notiz_id in(SELECT notiz_id FROM public.tbl_notizzuordnung WHERE person_id=$person_id)

