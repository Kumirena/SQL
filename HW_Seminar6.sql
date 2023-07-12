/* Урок 6. SQL – Транзакции. Временные таблицы, управляющие конструкции, циклы

1. Создайте функцию, которая принимает кол-во сек и формат их в кол-во дней часов. 
Пример: 123456 ->'1 days 10 hours 17 minutes 36 seconds '*/

USE Seminar6_HW;
DELIMITER $$
CREATE FUNCTION times(seconds INT)
RETURNS VARCHAR(20)
DETERMINISTIC
BEGIN
    DECLARE days INT default 0;
    DECLARE hours INT default 0;
    DECLARE minutes INT default 0;
    DECLARE result VARCHAR(20) default 0;

    WHILE seconds >= 86400 DO
    SET days = floor(seconds / 86400);
    SET seconds = seconds % 86400;
    END WHILE;

    WHILE seconds >= 3600 DO
    SET hours = floor(seconds / 3600);
    SET seconds = seconds % 3600;
    END WHILE;

    WHILE seconds >= 60 DO
    SET minutes = floor(seconds / 60);
    SET seconds = seconds % 60;
    END WHILE;

SELECT days, hours, minutes, seconds;
END $$
DELIMITER ;

CALL times(123456);

/* 2. Создайте процедуру, которая выводит только четные числа от 1 до 10.
 Пример: 2,4,6,8,10 */ 

DELIMITER $$
CREATE PROCEDURE numbers()
BEGIN
	CASE
		WHEN numbers() < 10 THEN
		SET n = n+2;
		INSERT INTO nums VALUES(n);
		SELECT * FROM nums;
	END CASE;
END $$
DELIMITER ;

CALL numbers; 
