CREATE FUNCTION space_travel(origin INT, destination INT, quantity BIGINT) RETURNS boolean AS $$ 
DECLARE
    sys_origin INT;
    sys_des INT;
    pop BIGINT;
BEGIN 
    SELECT id_system INTO sys_origin FROM planet WHERE id=origin;
    SELECT id_system INTO sys_des FROM planet WHERE id=destination;
    SELECT population INTO pop FROM planet WHERE id=origin;
    IF quantity > 0 AND sys_origin = sys_des AND pop >= quantity THEN 
    UPDATE planet SET population = population - quantity WHERE id=origin; 
    UPDATE planet SET population = population + quantity WHERE id = destination; 
    RETURN TRUE; 
ELSE RETURN FALSE; END IF; 
END; $$ LANGUAGE plpgsql;
CREATE FUNCTION list_satellite_inf_750(syst INT) RETURNS TABLE(satellite VARCHAR(32), planet VARCHAR(32), radius INT) AS $$ BEGIN RETURN QUERY SELECT satellite.name, planet.name, satellite.radius FROM satellite INNER JOIN planet ON satellite.id_planet=planet.id INNER JOIN planetary_system ON planet.id_system=planetary_system.id WHERE planetary_system.id=syst AND satellite.radius <= 750 ORDER BY planet.name, satellite.radius DESC, satellite.name; END; $$ LANGUAGE plpgsql;
