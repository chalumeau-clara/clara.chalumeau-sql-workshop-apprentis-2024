CREATE OR REPLACE FUNCTION list_assistant_transactions(_assistant VARCHAR(64))
RETURNS TABLE (can VARCHAR(32), "timestamp" TIMESTAMP) AS
$$
BEGIN
    RETURN QUERY
    SELECT transaction.can, transaction.timestamp FROM transaction WHERE assistant = _assistant;
END
$$
LANGUAGE plpgsql;
