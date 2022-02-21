SELECT surname, employee.name, email FROM employee INNER JOIN agency ON employee.agency_code=code WHERE ratings > 6.0 ORDER BY surname, employee.name, email;
