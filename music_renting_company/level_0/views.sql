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

CREATE OR REPLACE VIEW view_artists(artist, birthdate, songs) AS
    SELECT artist.name AS artist, artist.birth_date AS birthdate, count(music) FROM artist
    LEFT JOIN music ON music.art_id = artist.id
    GROUP BY artist.name, artist.birth_date
    ORDER BY artist.name;


CREATE OR REPLACE VIEW view_albums(album, songs, duration) AS
    SELECT album.name AS album, count(music) AS songs, duration_to_string(CAST(sum(CAST(duration AS INT)) AS INT)) AS duration
    FROM music_album
    FULL OUTER JOIN music ON music_album.music_id = music.id
    FULL OUTER JOIN album ON music_album.alb_id = album.id
    WHERE album.name IS NOT NULL
    GROUP BY album.name, music.duration
    ORDER BY album.name;

CREATE OR REPLACE VIEW view_songs(music, artist, duration) AS
    SELECT music.title AS music, artist.name AS artist, duration_to_string(CAST(sum(CAST(duration AS INT)) AS INT)) AS duration  FROM artist
    LEFT JOIN music ON music.art_id = artist.id
    WHERE music.title IS NOT NULL
    GROUP BY music.title, artist.name
    ORDER BY music.title, artist.name;
