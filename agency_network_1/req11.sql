SELECT id, CASE WHEN end_date < now()::date THEN 'Done' WHEN start_date > now()::date THEN 'Ongoing' ELSE 'Booked' END AS "trip status" FROM booking ORDER BY "trip status";
