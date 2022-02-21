SELECT name FROM creature FULL OUTER JOIN creature_template ON creature.gid=creature_template.id WHERE creature.id IS NULL ORDER BY name;
