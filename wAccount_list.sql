CREATE TABLE wAccount_list(
    account_number varchar(255) PRIMARY KEY,
    nic varchar(13)
);

INSERT INTO wAccount_list (account_number, nic) VALUES ('dummyAccount1', '200114400385');


ALTER TABLE wAccount_list
ADD COLUMN user_status ENUM('ACTIVE', 'INACTIVE') NOT NULL DEFAULT 'ACTIVE';

ALTER TABLE wAccount_list
ADD COLUMN meter_status ENUM('ACTIVE', 'INACTIVE') NOT NULL DEFAULT 'ACTIVE';

ALTER TABLE wAccount_list
ADD COLUMN iot_meter ENUM('YES', 'NO') NOT NULL DEFAULT 'NO';

ALTER TABLE wAccount_list
    ADD COLUMN region VARCHAR(25) NOT NULL;

ALTER TABLE wAccount_list
ADD COLUMN iot_id varchar(255) NOT NULL DEFAULT 'NO';

ALTER TABLE utilitysaga.wAccount_list
    ADD COLUMN sub_region VARCHAR(25),
    ADD COLUMN balance DECIMAL(10,2) NOT NULL DEFAULT 0;

ALTER TABLE utilitySaga.wAccount_list
ADD COLUMN timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP;

ALTER TABLE utilitySaga.wAccount_list
ADD COLUMN request_id INT NULL;


SELECT eal.account_number, u.nic, u.firstname, u.lastname, u.mobile, u.email, eal.address, eal.meter_status, eal.iot_meter, eal.iot_id
FROM users u
JOIN eaccount_list eal ON u.nic = eal.nic
JOIN electricity_admin ON eal.region= electricity_admin.region WHERE electricity_admin.region = 'COLOMBO';
