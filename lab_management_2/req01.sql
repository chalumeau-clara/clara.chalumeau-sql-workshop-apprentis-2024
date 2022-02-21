INSERT INTO can VALUES ('Dr Pepper', 100, 330, 0.70);
INSERT INTO transaction VALUES (19, 'helene.chelin', 'Dr Pepper', '2022-01-05 17:43:00');
UPDATE can SET stock = stock - 1 WHERE name='Dr Pepper';
