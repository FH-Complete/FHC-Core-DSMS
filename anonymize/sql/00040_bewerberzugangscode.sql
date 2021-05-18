------------------------------------------------------------------------------------------------------------------------
	-- ANONYMISIERUNG_SQL
------------------------------------------------------------------------------------------------------------------------
UPDATE public.tbl_person SET zugangscode=null WHERE
	person_id in(
	SELECT
		person_id
		--person_id, vorname, nachname
	FROM
		public.tbl_person
	WHERE
		-- kein Mitarbeiter
		NOT EXISTS(SELECT 1 FROM public.tbl_mitarbeiter JOIN public.tbl_benutzer ON(uid=mitarbeiter_uid)
			WHERE tbl_benutzer.person_id=tbl_person.person_id)
		-- kein Prestudentstatus innerhalb der letzten 3 Jahre
		AND NOT EXISTS(
			SELECT datum
			FROM
				public.tbl_prestudent
				JOIN public.tbl_prestudentstatus USING(prestudent_id)
			WHERE
				tbl_prestudent.person_id=tbl_person.person_id
				AND datum>now()-'3 years'::interval
				-- Manuellen Abgewiesenen fuer alle alten Eintraege herausfiltern
				AND NOT (tbl_prestudentstatus.datum='2018-04-25' AND tbl_prestudentstatus.status_kurzbz='Abgewiesener' AND tbl_prestudentstatus.insertvon='kindlm')
		)
		-- Kein Status ausser Aufnahme
		AND NOT EXISTS(
			SELECT *
			FROM
				public.tbl_prestudent
				JOIN public.tbl_prestudentstatus USING(prestudent_id)
			WHERE
				tbl_prestudent.person_id=tbl_person.person_id
				AND status_kurzbz NOT IN('Interessent','Bewerber','Wartender','Abgewiesener')
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
		-- kein Preincoming
		AND NOT EXISTS(
			SELECT 1
			FROM
				public.tbl_preincoming
			WHERE
				person_id=tbl_person.person_id
				AND (bis is null OR bis>now()-'3 years'::interval)
		)
		-- kein Projektbetreuer
		AND NOT EXISTS(
			SELECT 1
			FROM
				lehre.tbl_projektbetreuer
			WHERE
				person_id=tbl_person.person_id
		)
	AND zugangscode is not null
	)

------------------------------------------------------------------------------------------------------------------------
-- ANZAHL_SQL
------------------------------------------------------------------------------------------------------------------------
-- Bewerber SELECT--
SELECT
	count(*) as anzahl
	--person_id, vorname, nachname
FROM
	public.tbl_person
WHERE
	-- kein Mitarbeiter
	NOT EXISTS(SELECT 1 FROM public.tbl_mitarbeiter JOIN public.tbl_benutzer ON(uid=mitarbeiter_uid)
		WHERE tbl_benutzer.person_id=tbl_person.person_id)
	-- kein Prestudentstatus innerhalb der letzten 3 Jahre
	AND NOT EXISTS(
		SELECT datum
		FROM
			public.tbl_prestudent
			JOIN public.tbl_prestudentstatus USING(prestudent_id)
		WHERE
			tbl_prestudent.person_id=tbl_person.person_id
			AND datum>now()-'3 years'::interval
			-- Manuellen Abgewiesenen fuer alle alten Eintraege herausfiltern
			AND NOT (tbl_prestudentstatus.datum='2018-04-25' AND tbl_prestudentstatus.status_kurzbz='Abgewiesener' AND tbl_prestudentstatus.insertvon='kindlm')
	)
	-- Kein Status ausser Aufnahme
	AND NOT EXISTS(
		SELECT *
		FROM
			public.tbl_prestudent
			JOIN public.tbl_prestudentstatus USING(prestudent_id)
		WHERE
			tbl_prestudent.person_id=tbl_person.person_id
			AND status_kurzbz NOT IN('Interessent','Bewerber','Wartender','Abgewiesener')
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
	-- kein Preincoming
	AND NOT EXISTS(
		SELECT 1
		FROM
			public.tbl_preincoming
		WHERE
			person_id=tbl_person.person_id
			AND (bis is null OR bis>now()-'3 years'::interval)
	)
	-- kein Projektbetreuer
	AND NOT EXISTS(
		SELECT 1
		FROM
			lehre.tbl_projektbetreuer
		WHERE
			person_id=tbl_person.person_id
	)
	AND zugangscode is not null