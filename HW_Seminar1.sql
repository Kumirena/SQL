SELECT * FROM mobile_phone.phones;
-- Получим название,производителя и цену товара, количество которых превышает 2

SELECT name_phone, manufacturer, price FROM phones
WHERE quantity > 2;

-- Выводим весь ассортимент товаров марки Samsung
SELECT * FROM mobile_phone.phones
WHERE manufacturer = "Samsung";

