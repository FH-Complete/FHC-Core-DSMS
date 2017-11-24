INSERT INTO system.tbl_rolle(rolle_kurzbz, beschreibung)
SELECT 'DSMSExport', 'FHC-Core-DSMS - Exportieren von personenbezogenen Daten'
WHERE
	NOT EXISTS(SELECT 1 FROM system.tbl_rolle WHERE rolle_kurzbz='DSMSExport');

INSERT INTO system.tbl_rolleberechtigung(berechtigung_kurzbz, rolle_kurzbz, art)
SELECT 'dsms/export', 'DSMSExport', 's'
WHERE
	NOT EXISTS(
		SELECT 1 FROM system.tbl_rolleberechtigung
		WHERE rolle_kurzbz='DSMSExport' AND berechtigung_kurzbz='dsms/export');

INSERT INTO system.tbl_rolleberechtigung(berechtigung_kurzbz, rolle_kurzbz, art)
SELECT 'basis/person', 'DSMSExport', 's'
WHERE
	NOT EXISTS(
		SELECT 1 FROM system.tbl_rolleberechtigung
		WHERE rolle_kurzbz='DSMSExport' AND berechtigung_kurzbz='basis/person');

INSERT INTO system.tbl_rolleberechtigung(berechtigung_kurzbz, rolle_kurzbz, art)
SELECT 'basis/student', 'DSMSExport', 's'
WHERE
	NOT EXISTS(
		SELECT 1 FROM system.tbl_rolleberechtigung
		WHERE rolle_kurzbz='DSMSExport' AND berechtigung_kurzbz='basis/student');

INSERT INTO system.tbl_rolleberechtigung(berechtigung_kurzbz, rolle_kurzbz, art)
SELECT 'basis/prestudent', 'DSMSExport', 's'
WHERE
	NOT EXISTS(
		SELECT 1 FROM system.tbl_rolleberechtigung
		WHERE rolle_kurzbz='DSMSExport' AND berechtigung_kurzbz='basis/prestudent');

INSERT INTO system.tbl_rolleberechtigung(berechtigung_kurzbz, rolle_kurzbz, art)
SELECT 'basis/mitarbeiter', 'DSMSExport', 's'
WHERE
	NOT EXISTS(
		SELECT 1 FROM system.tbl_rolleberechtigung
		WHERE rolle_kurzbz='DSMSExport' AND berechtigung_kurzbz='basis/mitarbeiter');

INSERT INTO system.tbl_rolleberechtigung(berechtigung_kurzbz, rolle_kurzbz, art)
SELECT 'basis/benutzer', 'DSMSExport', 's'
WHERE
	NOT EXISTS(
		SELECT 1 FROM system.tbl_rolleberechtigung
		WHERE rolle_kurzbz='DSMSExport' AND berechtigung_kurzbz='basis/benutzer');
