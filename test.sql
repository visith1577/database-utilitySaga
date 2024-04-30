SELECT users.pwd FROM users WHERE nic = 200114400385;

SELECT * from electricity_bill ORDER BY dueDate DESC ;


UPDATE users SET  pwd = 'cuekskamkdk' WHERE nic = 200114400385;


SELECT water_bill.* FROM wAccount_list JOIN water_bill
    ON wAccount_list.account_number = water_bill.account_number
    WHERE wAccount_list.nic = '200114400380' LIMIT 5 OFFSET 5;

SELECT COUNT(*) FROM users WHERE uname = 'user';

CREATE TABLE elecdummyACC3_emeter (
    id INT AUTO_INCREMENT PRIMARY KEY,
    date DATE NOT NULL,
    time TIME NOT NULL,
    data INT,
    active BOOLEAN
);

SELECT MAX(date), MIN(time), MAX(data)
FROM `200114400385/account_v3_test_meter`
WHERE date BETWEEN DATE_SUB(CURDATE(), INTERVAL 13 MONTH) AND  CURDATE() GROUP BY MONTH(date), YEAR(date);

SELECT id, date, time, data
FROM `200114400385/account_v3_test_meter`
WHERE date = curdate()
UNION
(SELECT id, date, time, data FROM `200114400385/account_v3_test_meter`
WHERE date = DATE_ADD(CURDATE(), INTERVAL 1 DAY)
ORDER BY time ASC LIMIT 1);

SELECT date, MIN(time), MIN(data) FROM `200114400385/account_v3_test_meter`
WHERE MONTH(date) = MONTH(CURDATE()) AND YEAR(date) = YEAR(CURDATE())
GROUP BY date;

CREATE TABLE elecdummyACC3_budget_values(
    id INT AUTO_INCREMENT PRIMARY KEY,
    month VARCHAR(100),
    data INT,
    date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO `200114400385/account_v3_test_budget_values` (month, data) VALUES ('January', 10000);
INSERT INTO `200114400385/account_v3_test_budget_values` (month, data) VALUES ('January', 9000);
INSERT INTO `200114400385/account_v3_test_budget_values` (month, data) VALUES ('February', 9000);
INSERT INTO `200114400385/account_v3_test_budget_values` (month, data) VALUES ('March', 9000);
INSERT INTO `200114400385/account_v3_test_budget_values` (month, data) VALUES ('April', 12000);
INSERT INTO `200114400385/account_v3_test_budget_values` (month, data) VALUES ('April', 11000);

SELECT month, data FROM `200114400385/account_v3_test_budget_values` ORDER BY date DESC;

SELECT data FROM `200114400385/account_v3_test_budget_values` WHERE month = 'january' ORDER BY date DESC LIMIT 1;

SELECT id, month, data
FROM `200114400385/account_v3_test_budget_values`
WHERE EXTRACT(MONTH FROM date) = 3;

SELECT date, MIN(time) as time, MAX(data) as data FROM `200114400385/account_v3_test_meter`
WHERE MONTH(date) = MONTH(CURDATE()) AND YEAR(date) = YEAR(CURDATE())
GROUP BY date ORDER BY date
LIMIT 1;

CREATE TABLE test_meter (
    id INT AUTO_INCREMENT PRIMARY KEY,
    date DATE DEFAULT (CURRENT_DATE()),
    time TIME DEFAULT (CURRENT_TIME()),
    data INT,
    active BOOLEAN DEFAULT TRUE
);


CREATE TABLE wmv21010_budget_values(
    id INT AUTO_INCREMENT PRIMARY KEY,
    month VARCHAR(100),
    data INT,
    date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


CREATE TABLE my_table (
    id INT AUTO_INCREMENT PRIMARY KEY,
    data VARCHAR(255),
    created_date DATE DEFAULT (CURRENT_DATE()),
    created_time TIME DEFAULT (CURRENT_TIME())
);

INSERT INTO my_table (data) VALUES (1);

SELECT date, MIN(time) as time, MAX(data) as data FROM wmv21010_meter
                            WHERE MONTH(date) = MONTH(CURDATE()) AND YEAR(date) = YEAR(CURDATE())
                            GROUP BY date;