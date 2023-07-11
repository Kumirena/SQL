DROP DATABASE IF EXISTS Seminar5_HW;
CREATE DATABASE Seminar5_HW;
USE Seminar5_HW;

DROP TABLE IF EXISTS cars;
CREATE TABLE cars(
	id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(45),
    cost INT
);

INSERT cars (id, name, cost)
VALUES
	(1, "Audi", 52642),
    (2, "Mercedes", 57127 ),
    (3, "Skoda", 9000 ),
    (4, "Volvo", 29000),
	(5, "Bentley", 350000),
    (6, "Citroen ", 21000 ), 
    (7, "Hummer", 41400), 
    (8, "Volkswagen ", 21600);
    
SELECT *
FROM cars;

-- 1. Создайте представление, в которое попадут автомобили стоимостью до 25 000 долларов

CREATE VIEW cars_cost AS
SELECT name, cost
FROM cars
WHERE cost < 25000;

SELECT * FROM cars_cost;


/* Изменить в существующем представлении порог для стоимости: пусть цена будет до 30 000 долларов
(используя оператор ALTER VIEW)*/

ALTER VIEW cars_cost AS
SELECT name, cost
FROM cars
WHERE cost < 30000;

SELECT * FROM cars_cost;


-- Создайте представление, в котором будут только автомобили марки “Шкода” и “Ауди” (аналогично)

ALTER VIEW cars_cost AS
SELECT name, cost
FROM cars
WHERE name = "Skoda" OR name = "Audi";

SELECT * FROM cars_cost;


-- Дополнительные задания. Получить ранжированный список автомобилей по цене в порядке возрастания

SELECT * FROM cars
ORDER BY cost ASC;


--  Получить топ-3 самых дорогих автомобилей, а также их общую стоимость
SELECT name, cost,
SUM(cost) OVER (  ) AS `sum`
FROM cars
ORDER BY cost DESC
LIMIT 3;


-- Получить список автомобилей, у которых цена больше предыдущей цены

SELECT cars.id, cars.name, cars.cost
FROM cars 
JOIN cars cars_1 ON cars.id = cars_1.id + 1
WHERE cars.cost > cars_1.cost;


--  Получить список автомобилей, у которых цена меньше следующей цены

SELECT cars.id, cars.name, cars.cost
FROM cars 
JOIN cars cars_1 ON cars.id +1 = cars_1.id 
WHERE cars.cost < cars_1.cost;

/*Получить список автомобилей, отсортированный по возрастанию цены, 
 и добавить столбец со значением разницы между текущей ценой и ценой следующего автомобиля*/
 
SELECT cars.id, cars.name, cars.cost,  
(LEAD (cost) Over(ORDER BY cost ASC)) -cars.cost As "Разница"
FROM cars;



