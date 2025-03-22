CREATE OR REPLACE PROCEDURE get_client_orders(
    IN p_client_id INTEGER
)
LANGUAGE plpgsql
AS $$
DECLARE
    order_record RECORD;
BEGIN
    -- Создаем временную таблицу для хранения результатов
    CREATE TEMP TABLE temp_orders (
        order_id INTEGER,
        order_date TIMESTAMP,
        total_price MONEY
    ) ON COMMIT DROP;

    -- Вставляем данные в временную таблицу
    INSERT INTO temp_orders (order_id, order_date, total_price)
    SELECT id, date, total_price
    FROM public.orders
    WHERE client_id = p_client_id;

    -- Возвращаем данные из временной таблицы
    FOR order_record IN SELECT * FROM temp_orders LOOP
        RAISE NOTICE 'Order ID: %, Date: %, Total Price: %',
            order_record.order_id, order_record.order_date, order_record.total_price;
    END LOOP;
END;
$$;

