CREATE TABLE artist_dup (
id            SERIAL,
name          VARCHAR(64),
birth_date    DATE
);
INSERT INTO artist_dup VALUES (DEFAULT, 'Edith PIAF', '1915-12-19'), (DEFAULT, 'France GALL', '1947-10-09'), (DEFAULT, 'Joe DASSIN', '1938-11-05'), (DEFAULT, 'Jean-Jacques GOLDMAN', '1951-10-11');
