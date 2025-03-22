CREATE OR REPLACE PROCEDURE add_new_client(
    IN p_surname VARCHAR(100),
    IN p_name VARCHAR(100),
    IN p_lastname VARCHAR(100),
    IN p_birthdate DATE
)
LANGUAGE plpgsql
AS $$
BEGIN
    INSERT INTO public.clients (surname, name, lastname, birthdate)
    VALUES (p_surname, p_name, p_lastname, p_birthdate);
END;
$$;

