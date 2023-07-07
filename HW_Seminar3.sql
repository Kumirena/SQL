DROP DATABASE IF EXISTS seminar3;
CREATE DATABASE IF NOT EXISTS `seminar3`;
USE `seminar3`;

DROP TABLE IF EXISTS `staff`;
CREATE TABLE IF NOT EXISTS `staff`
(
`id` INT PRIMARY KEY AUTO_INCREMENT,
`firstname` VARCHAR(45),
`lastname` VARCHAR(45),
`post` VARCHAR(45),
`seniority` INT,
`salary` INT,
`age` INT);

INSERT INTO `staff` (`firstname`, `lastname`, `post`,`seniority`,`salary`, `age`)
VALUES
('Вася', 'Васькин', 'Начальник', 40, 100000, 60), 
('Петр', 'Власов', 'Начальник', 8, 70000, 30),
('Катя', 'Катина', 'Инженер', 2, 70000, 25),
('Саша', 'Сасин', 'Инженер', 12, 50000, 35),
('Иван', 'Петров', 'Рабочий', 40, 30000, 59),
('Петр', 'Петров', 'Рабочий', 20, 55000, 60),
('Сидр', 'Сидоров', 'Рабочий', 10, 20000, 35),
('Антон', 'Антонов', 'Рабочий', 8, 19000, 28),
('Юрий', 'Юрков', 'Рабочий', 5, 15000, 25),
('Максим', 'Петров', 'Рабочий', 2, 11000, 19),
('Юрий', 'Петров', 'Рабочий', 3, 12000, 24),
('Людмила', 'Маркина', 'Уборщик', 10, 10000, 49);

SELECT * FROM staff;

DROP TABLE IF EXISTS `activity_staff`;
CREATE TABLE IF NOT EXISTS `activity_staff`
(`id` INT PRIMARY KEY AUTO_INCREMENT,
`staff_id` INT,
FOREIGN KEY (staff_id) REFERENCES staff(id),
`date_activity` DATE,
`count_pages` INT
);


INSERT activity_staff (`staff_id`, `date_activity`, `count_pages`)
VALUES
(1,'2022-01-01',250),
(2,'2022-01-01',220),
(3,'2022-01-01',170),
(1,'2022-01-02',100),
(2,'2022-01-01',220),
(3,'2022-01-01',300),
(7,'2022-01-01',350),
(1,'2022-01-03',168),
(2,'2022-01-03',62),
(3,'2022-01-03',84);
/*
Урок 3. SQL – выборка данных, сортировка, агрегатные функции
Условие по таблице staff:
Отсортируйте данные по полю заработная плата (salary) в порядке: 
убывания; возрастания  */

SELECT * FROM staff
ORDER BY salary ASC;

SELECT * FROM staff
ORDER BY salary DESC; 

-- Выведите 5 максимальных заработных плат (salary)

SELECT salary AS "максимальные зарплаты", lastname `ФИО сотрудника`
FROM staff
ORDER BY salary DESC
LIMIT 0,5;

-- Посчитайте суммарную зарплату (salary) по каждой специальности (роst)

SELECT SUM(salary) 'Сумма по должности',
post `Должность`
FROM staff
GROUP BY post;

-- Найдите кол-во сотрудников с специальностью (post) «Рабочий» 
-- в возрасте от 24 до 49 лет включительно.

SELECT  COUNT(post)
FROM staff
WHERE post ="Рабочий" AND age > 24 AND age <=49
GROUP BY post;

-- Найдите кол-во специальностей

SELECT COUNT(DISTINCT post) `кол-во специальностей` 
FROM staff;

-- Выведите специальности, у которых средний возраст сотрудников меньше 30 лет включительно

SELECT post, AVG(age)`средний возраст`
FROM staff 
GROUP BY post 
HAVING AVG(age) <= 30;

-- Выведите id сотрудников, которые напечатали более 500 страниц за все дни

SELECT staff_id, SUM(count_pages)
FROM activity_staff
GROUP BY staff_id
HAVING  SUM(count_pages)> 500;


-- Выведите дни, когда работало более 3 сотрудников 
-- Также укажите кол-во сотрудников, которые работали в выбранные дни.

SELECT date_activity `День`, COUNT(DISTINCT staff_id) `Kол-во работающих`
FROM activity_staff
GROUP BY date_activity
HAVING COUNT(DISTINCT staff_id) > 3;

-- Выведите среднюю заработную плату по должностям, которая составляет более 30000

SELECT post, AVG(salary)`средняя зарплата`
FROM staff 
GROUP BY post 
HAVING AVG(salary) > 30000;
