-- Deliverable 1.
-- Insert employee and title information into a new table (retirement_titles)
-- who were born between years 1952 and 1955 and order by employee number.
SELECT e.emp_no
      ,e.first_name
      ,e.last_name
      ,t.title
      ,t.from_date
      ,t.to_date
INTO retirement_titles
FROM employees e
JOIN titles t
ON e.emp_no = t.emp_no
WHERE e.birth_date BETWEEN '1952-01-01' AND '1955-12-31'
ORDER by e.emp_no;

-- Use Dictinct with Orderby to remove duplicate rows.
SELECT DISTINCT ON (rt.emp_no) rt.emp_no
      ,rt.first_name
      ,rt.last_name
      ,rt.title
INTO unique_titles
FROM retirement_titles rt
WHERE rt.to_date = '9999-01-01'
ORDER BY rt.emp_no, rt.to_date DESC;

-- Retrieve the number of employees by their most recent job title who are about to retire.
SELECT COUNT(ut.title) AS "count"
      ,ut.title
INTO retiring_titles
FROM unique_titles ut
GROUP BY ut.title
ORDER BY "count" DESC;

-- Deliverable 2.
-- Insert employees eligible for mentorship eligibility into new mentorship_eligibilty table.
SELECT DISTINCT ON (e.emp_no) e.emp_no
      ,e.first_name
      ,e.last_name
      ,e.birth_date
      ,de.from_date
      ,de.to_date
      ,t.title
INTO mentorship_eligibilty
FROM employees e
JOIN dept_employee de
ON e.emp_no = de.emp_no
JOIN titles t
ON e.emp_no = t.emp_no
WHERE de.to_date = '9999-01-01'
AND e.birth_date BETWEEN '1965-01-01' AND '1965-12-31'
ORDER BY e.emp_no;

