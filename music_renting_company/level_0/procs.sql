CREATE OR REPLACE FUNCTION duration_to_string(duration INT)
RETURNS VARCHAR(16) AS
$$
DECLARE
s INTEGER;
ss VARCHAR(16);
m INTEGER;
BEGIN
    m:=0;
    s:=0;
    IF duration > 0 THEN
        WHILE duration >= 60 LOOP
            m := m + 1;
            duration:=duration-60;
        END LOOP;
        s:=duration;
        IF s < 10 THEN
            ss := ('0' || s)::VARCHAR(16);
        ELSE
            ss:=s::VARCHAR(16);
        END IF;
        RETURN (m || ':' || ss)::VARCHAR(16);
    ELSE
        RETURN regexp_replace(TO_CHAR(('0 second')::interval, 'MI:SS'), '^0(.*):', '\1:')::VARCHAR(16);
    END IF;
END;
$$
LANGUAGE plpgsql;
