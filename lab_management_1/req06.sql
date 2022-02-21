SELECT login FROM transaction FULL OUTER JOIN assistant ON  transaction.assistant=assistant.login WHERE can IS NULL ORDER BY login;
