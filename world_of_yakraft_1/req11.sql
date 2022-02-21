SELECT title, name FROM quest INNER JOIN creature ON quest.creature_start = creature.id INNER JOIN creature_template ON creature.gid=creature_template.id ORDER BY title, creature_template.name;
