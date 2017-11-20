-- Category: Student
SELECT
	student_uid,
	matrikelnr,
	prestudent_id,
	studiengang_kz,
	semester,
	verband,
	gruppe
FROM
	public.tbl_student
WHERE
	student_uid=$uid

