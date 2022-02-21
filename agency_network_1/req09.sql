SELECT DISTINCT customer_surname, end_date FROM booking WHERE start_date < date '2019-03-11' AND end_date > date '2019-03-11' ORDER BY customer_surname;
