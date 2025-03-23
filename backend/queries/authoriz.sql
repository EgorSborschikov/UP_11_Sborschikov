SELECT e."IDEmployee",
    CONCAT(e."Surname", ' ', e."Name", ' ', e."LastName") AS full_name,
    e."IDPosition",
    e."IDBranch"
FROM auth a
JOIN employees e ON a."IDAuth" = e."IDAuth"
WHERE a."Login" = CAST(@1 AS VARCHAR) AND a."Password" = CAST(@2 AS VARCHAR)