-- Category: Messages
SELECT
	subject,
	body,
	oe_kurzbz,
	person_id,
	priority,
	relationmessage_id,
	(SELECT array_agg(statusinfo) FROM public.tbl_msg_status WHERE message_id=tbl_msg_message.message_id AND person_id=$person_id) as "Status"
FROM
	public.tbl_msg_message
WHERE
	person_id=$person_id
	OR
	message_id IN(SELECT message_id FROM public.tbl_msg_recipient WHERE person_id=$person_id)
