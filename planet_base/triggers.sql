CREATE TABLE Modif (
    id SERIAL NOT NULL,
    date TIMESTAMP,
    old BIGINT,
    new BIGINT
);

CREATE VIEW view_earth_population_evolution AS
    SELECT id, TO_CHAR(date, 'dd/mm/yyyy hh24:mi:ss') AS date, old AS "old population", new AS "new population" FROM Modif;

CREATE OR REPLACE FUNCTION update_view_earth_population_evolution() RETURNS TRIGGER AS $$
    BEGIN
        IF NEW.name = 'Earth' THEN
            INSERT INTO Modif VALUES (DEFAULT, now(), OLD.population, NEW.population);
            OLD.population = NEW.population;
        END IF;
        RETURN OLD;
    END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER store_earth_population_updates BEFORE UPDATE ON planet
    FOR EACH ROW EXECUTE FUNCTION update_view_earth_population_evolution();
