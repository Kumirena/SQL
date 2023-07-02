
/*
1. Используя операторы языка SQL, создайте табличку “sales”. Заполните ее данными
*/

DROP DATABASE IF EXISTS sales;
CREATE DATABASE IF NOT EXISTS sales;

USE sales;
DROP TABLE IF EXISTS sales;
CREATE TABLE IF NOT EXISTS sales
(
id INT PRIMARY KEY AUTO_INCREMENT,
order_date DATE NOT NULL,
count_product INT NOT NULL);

INSERT INTO sales (order_date, count_product)
VALUES
  ("2022-01-01",156),
  ("2022-01-02",180),
  ("2022-01-03",21),
  ("2022-01-04",124),
  ("2022-01-05",341);
  
  /*
2. Для данных таблицы "sales" укажите тип заказа в зависимости от количества: меньше 100 - Маленьктй заказ,
от 100 до 300 -Средний заказ и больше 300 - Большой заказ.
*/
  SELECT id, order_date, count_product,
IF(count_product < 100, "Маленький заказ",
	IF(count_product >= 100 AND count_product < 300, "Cредний заказ",
		IF(count_product >= 300, "Большой заказ", "Неопределенно"))) AS "Order quantity"
FROM sales;

/*
3. Создайте таблицу “orders”, заполните ее значениями. Покажите “полный” статус заказа, используя оператор CASE
*/
DROP DATABASE IF EXISTS orders;
CREATE DATABASE IF NOT EXISTS orders;

USE orders;
DROP TABLE IF EXISTS orders;
CREATE TABLE IF NOT EXISTS orders
(
    order_id INT NOT NULL AUTO_INCREMENT,
    employee_id VARCHAR(5) NOT NULL,
    amount DECIMAL(20, 2) NOT NULL,
    order_status VARCHAR(45) NOT NULL);

INSERT INTO orders (employee_id, amount, order_status)
VALUES
	("e03",15.00,"OPEN"),
	("e01",25.50,"OPEN"),
	("e05",100.70,"CLOSED"),
	("e02",22.18,"OPEN"),
	("e04",9.50,"CANCELLED");
  
  SELECT order_id, order_status,
CASE order_status
    WHEN "OPEN" THEN 'Order is in open state.'
    WHEN "CLOSED" THEN 'Order is closed.'
    ELSE 'Order is cancelled.'
END AS full_order_status
FROM orders;

/*
4. Чем NULL отличается от 0?
"0" — это значение, равное 0, константа. 
A "NULL" указывает на "пустое место, пустую ячейку" — объявленную, но неинициализированную переменную, объект и т.п.
*/
  