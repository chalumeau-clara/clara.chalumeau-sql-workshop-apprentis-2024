SELECT regexp_replace(acronym, '^(..)(.)$', '\10\2') AS acronym FROM destination ORDER BY acronym;
