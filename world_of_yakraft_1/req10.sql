SELECT creature.id FROM creature INNER JOIN creature_template ON creature.gid=creature_template.id WHERE level > 10 ORDER BY creature.id;
