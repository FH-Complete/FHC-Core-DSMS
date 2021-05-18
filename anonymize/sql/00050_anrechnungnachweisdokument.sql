------------------------------------------------------------------------------------------------------------------------
	-- ANONYMISIERUNG_SQL
------------------------------------------------------------------------------------------------------------------------
WITH temp AS(
   SELECT anrechnung_id, dms_id
   FROM lehre.tbl_anrechnung_anrechnungstatus status
   JOIN lehre.tbl_anrechnung anrechnung USING (anrechnung_id)

   -- Genehmigte / Abgelehnte Anrechnungen
   WHERE (status_kurzbz = 'approved' OR status_kurzbz = 'rejected')

   -- wo Entscheidung mehr als 3 Jahre zurückliegt
   AND status.insertamum::date < (NOW() - '3 years'::INTERVAL)::date

   -- und Nachweisdokument vorhanden ist
   AND dms_id IS NOT NULL
)

-- DMS Version Eintrag löschen
, delDMSVer AS (DELETE FROM campus.tbl_dms_version WHERE dms_id IN (SELECT dms_id FROM temp))

-- Anrechnung DMS ID auf NULL setzen
, upd AS (UPDATE lehre.tbl_anrechnung SET dms_id = NULL WHERE anrechnung_id IN (SELECT anrechnung_id FROM temp))

-- DMS Eintrag löschen
, delDMS AS (DELETE FROM campus.tbl_dms WHERE dms_id IN (SELECT dms_id FROM temp))

-- AUSFÜHREN
SELECT * FROM temp;

------------------------------------------------------------------------------------------------------------------------
-- ANZAHL_SQL
------------------------------------------------------------------------------------------------------------------------
SELECT
  count(*) as anzahl
-- anrechnung_id, status.status_kurzbz,status.insertamum::date
FROM
  lehre.tbl_anrechnung_anrechnungstatus status
JOIN
  lehre.tbl_anrechnung anrechnung USING (anrechnung_id)
WHERE
  -- Genehmigte / Abgelehnte Anrechnungen
  (status_kurzbz = 'approved' OR status_kurzbz = 'rejected')

  -- wo Entscheidung mehr als 3 Jahre zurückliegt
  AND status.insertamum::date < (NOW() - '3 years'::INTERVAL)::date

  -- und Nachweisdokument vorhanden ist
  AND dms_id IS NOT NULL