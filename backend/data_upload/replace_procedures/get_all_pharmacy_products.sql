CREATE OR REPLACE PROCEDURE get_all_pharmacy_products()
LANGUAGE plpgsql
AS $$
BEGIN
    PERFORM * FROM public.pharmacy_products;
END;
$$;

