CREATE OR REPLACE FUNCTION extension_dsms_create_table () RETURNS TEXT AS $$
	CREATE TABLE extension.tbl_dsms_anonymisierung
	(
		anonymisierung_kurzbz varchar(128),
		anonymisierung_sql text,
		anzahl_sql text,
		aktiv boolean,
		beschreibung text,
		last_execute timestamp
	);

	COMMENT ON TABLE extension.tbl_dsms_anonymisierung IS 'DSMS - Anonymization';

	ALTER TABLE extension.tbl_dsms_anonymisierung ADD CONSTRAINT pk_tbl_dsms_anonymisierung PRIMARY KEY (anonymisierung_kurzbz);

	GRANT SELECT, INSERT, UPDATE, DELETE ON extension.tbl_dsms_anonymisierung TO vilesci;

	SELECT 'Table added'::text;
 $$
LANGUAGE 'sql';

SELECT
	CASE
	WHEN (SELECT true::BOOLEAN FROM pg_catalog.pg_tables WHERE schemaname = 'extension' AND tablename = 'tbl_dsms_anonymisierung')
	THEN (SELECT 'success'::TEXT)
	ELSE (SELECT extension_dsms_create_table())
END;

-- Drop function
DROP FUNCTION extension_dsms_create_table();
