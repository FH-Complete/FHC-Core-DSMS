------------------------------------------------------------------------------------------------------------------------
	-- ANONYMISIERUNG_SQL
------------------------------------------------------------------------------------------------------------------------
UPDATE public.tbl_person set svnr=null WHERE person_id in(SELECT
		person_id
	FROM
		public.tbl_person
	WHERE
		-- kein Mitarbeiter
		NOT EXISTS(SELECT 1 FROM public.tbl_mitarbeiter JOIN public.tbl_benutzer ON(uid=mitarbeiter_uid)
			WHERE tbl_benutzer.person_id=tbl_person.person_id)
		-- kein Prestudentstatus innerhalb der letzten 2 Jahre
		AND NOT EXISTS(
			SELECT datum
			FROM
				public.tbl_prestudent
				JOIN public.tbl_prestudentstatus USING(prestudent_id)
			WHERE
				tbl_prestudent.person_id=tbl_person.person_id
				AND datum>now()-'2 years'::interval
				-- Manuellen Abgewiesenen fuer alle alten Eintraege herausfiltern
				AND NOT (tbl_prestudentstatus.datum='2018-04-25' AND tbl_prestudentstatus.status_kurzbz='Abgewiesener' AND tbl_prestudentstatus.insertvon='kindlm')
		)
		-- kein aktiver Benutzer
		AND NOT EXISTS(
			SELECT 1
			FROM
				public.tbl_benutzer
			WHERE
				person_id=tbl_person.person_id
				AND tbl_benutzer.aktiv
		)
		-- kein aktueller Preincoming
		AND NOT EXISTS(
			SELECT 1
			FROM
				public.tbl_preincoming
			WHERE
				person_id=tbl_person.person_id
				AND (bis is null OR bis>now()-'2 years'::interval)
		)

		AND svnr is not null
	)

------------------------------------------------------------------------------------------------------------------------
-- ANZAHL_SQL
------------------------------------------------------------------------------------------------------------------------
SELECT
	count(*) as anzahl
	--person_id, vorname, nachname, svnr
FROM
	public.tbl_person
WHERE
	-- kein Mitarbeiter
	NOT EXISTS(SELECT 1 FROM public.tbl_mitarbeiter JOIN public.tbl_benutzer ON(uid=mitarbeiter_uid)
		WHERE tbl_benutzer.person_id=tbl_person.person_id)
	-- kein Prestudentstatus innerhalb der letzten 2 Jahre
	AND NOT EXISTS(
		SELECT datum
		FROM
			public.tbl_prestudent
			JOIN public.tbl_prestudentstatus USING(prestudent_id)
		WHERE
			tbl_prestudent.person_id=tbl_person.person_id
			AND datum>now()-'2 years'::interval
			-- Manuellen Abgewiesenen fuer alle alten Eintraege herausfiltern
			AND NOT (tbl_prestudentstatus.datum='2018-04-25' AND tbl_prestudentstatus.status_kurzbz='Abgewiesener' AND tbl_prestudentstatus.insertvon='kindlm')
	)
	-- kein aktiver Benutzer
	AND NOT EXISTS(
		SELECT 1
		FROM
			public.tbl_benutzer
		WHERE
			person_id=tbl_person.person_id
			AND tbl_benutzer.aktiv
	)
	-- kein aktueller Preincoming
	AND NOT EXISTS(
		SELECT 1
		FROM
			public.tbl_preincoming
		WHERE
			person_id=tbl_person.person_id
			AND (bis is null OR bis>now()-'2 years'::interval)
	)
	AND svnr is not null