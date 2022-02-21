CREATE OR REPLACE FUNCTION buy_can(_assistant VARCHAR(64), _can VARCHAR(32))
RETURNS BOOLEAN AS
$$
DECLARE
    a_credit NUMERIC(5,2);
    a_price NUMERIC(3,2);
BEGIN
    SELECT credit INTO a_credit FROM assistant WHERE login=_assistant;
    SELECT price INTO a_price FROM can WHERE name=_can;
    IF a_credit >= a_price THEN
        INSERT INTO transaction VALUES (DEFAULT, _assistant,_can, now()::TIMESTAMP);
        UPDATE can SET stock = stock - 1 WHERE name=_can;
        UPDATE assistant SET credit = credit - a_price WHERE login=_assistant;
        RETURN TRUE;
    ELSE
        RETURN FALSE;
    END IF;
END;
$$
LANGUAGE plpgsql;
