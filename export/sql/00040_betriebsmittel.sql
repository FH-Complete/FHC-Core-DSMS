-- Category: Betriebsmittel
SELECT
	tbl_betriebsmittel.betriebsmitteltyp,
	tbl_betriebsmittel.inventarnummer,
	tbl_betriebsmittel.nummer,
	tbl_betriebsmittelperson.ausgegebenam,
	tbl_betriebsmittelperson.retouram,
	tbl_betriebsmittelperson.uid,
	tbl_betriebsmittelperson.kaution,
	tbl_betriebsmittelperson.anmerkung
	
FROM
	wawi.tbl_betriebsmittelperson
	JOIN wawi.tbl_betriebsmittel USING(betriebsmittel_id)
WHERE
	person_id=$person_id
