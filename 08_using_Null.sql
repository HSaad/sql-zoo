-- 1. NULL, INNER JOIN, LEFT JOIN, RIGHT JOIN
/*
	List the teachers who have NULL for their department.
*/

SELECT name 
  FROM teacher
 WHERE dept IS NULL;

-- 2. INNER JOIN
/*
	Note the INNER JOIN misses the teachers with not department and the
	departments with no teachers.
*/

SELECT teacher.name, dept.name
 FROM teacher INNER JOIN dept   
    ON (teacher.dept=dept.id);

-- 3. LEFT JOIN
/*
	Use a different JOIN so all teachers are listed.
*/

SELECT teacher.name, dept.name
 FROM teacher LEFT JOIN dept   
    ON (teacher.dept=dept.id);

-- 4. RIGHT JOIN
/*
	Use a different JOIN so that all departments are listed.
*/

SELECT teacher.name, dept.name
 FROM teacher RIGHT JOIN dept   
    ON (teacher.dept=dept.id);

-- 5. Using the COALESCE function
/*
	Show the teacher name and mobile number or '07986 444 2266'
*/

SELECT name, COALESCE(mobile, '07986 444 2266')
 FROM teacher;

-- 6. COALESCE and LEFT JOIN
/*
	Use the COALESCE function and a LEFT JOIN to print the teacher
	name and department name.
*/

SELECT teacher.name, COALESCE(dept.name, 'None')
 FROM teacher LEFT JOIN dept   
    ON (teacher.dept=dept.id);

-- 7. COUNT teacher and mobile
/*
	Use COUNT to show the number of teachers and the number of 
	mobile phones.
*/

SELECT COUNT(name), COUNT(mobile)
  FROM teacher;

-- 8. Department and staff
/*
	Show each department and the number of staff.
*/

SELECT dept.name, COUNT(teacher.id)
 FROM teacher RIGHT JOIN dept
  ON teacher.dept = dept.id
GROUP BY dept.name

-- 9.
/*
	Use CASE to show the name of each teacher followed by 'Sci' if
	the teacher is dept 1 or 2, and 'Art' otherwise.
*/	

SELECT name, CASE WHEN dept = 1 OR dept = 2 THEN 'Sci' ELSE 'Art' END
  FROM teacher;

-- 10.
/*
	Use CASE to show the name of each teacher followed by 'Sci' if the
	teacher is in dept 1 or 2, show 'Art' if the teacher's dept is 3 and
	'None' otherwise.
*/
SELECT name, CASE dept 
              WHEN 1 THEN 'Sci' 
              WHEN 2 THEN 'Sci'
              WHEN 3 THEN 'Art' 
              ELSE 'None' END
  FROM teacher;
