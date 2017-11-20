-- Category: Studentenstatus
SELECT
	datum,
	studiensemester_kurzbz,
	status_kurzbz,
	ausbildungssemester,
	bewerbung_abgeschicktamum,
	faktiv,
	fgm,
	orgform_kurzbz,
	rt_stufe,
	(SELECT bezeichnung_mehrsprachig[1] FROM public.tbl_status_grund WHERE statusgrund_id=tbl_prestudentstatus.statusgrund_id) as "Statusgrund",
	(SELECT bezeichnung FROM lehre.tbl_studienplan WHERE studienplan_id=tbl_prestudentstatus.studienplan_id) as "Studienplan",
	anmerkung 
FROM
	public.tbl_prestudentstatus
WHERE
	prestudent_id=$prestudent_id
ORDER BY
	datum, insertamum
