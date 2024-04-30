CREATE TABLE eAccount_list(
    account_number varchar(255) PRIMARY KEY,
    nic varchar(13) NOT NULL
);

ALTER TABLE eAccount_list
ADD COLUMN user_status ENUM('ACTIVE', 'INACTIVE') NOT NULL DEFAULT 'ACTIVE';

ALTER TABLE eAccount_list
ADD COLUMN meter_status ENUM('ACTIVE', 'INACTIVE') NOT NULL DEFAULT 'ACTIVE';

ALTER TABLE eAccount_list
ADD COLUMN iot_meter ENUM('YES', 'NO') NOT NULL DEFAULT 'NO';

ALTER TABLE eAccount_list
    ADD COLUMN region VARCHAR(25) NOT NULL;

ALTER TABLE eAccount_list
ADD COLUMN iot_id varchar(255) NOT NULL DEFAULT 'NO';

ALTER TABLE utilitysaga.eAccount_list
    ADD COLUMN sub_region VARCHAR(25),
    ADD COLUMN balance DECIMAL(10,2) NOT NULL DEFAULT 0;

ALTER TABLE utilitySaga.eAccount_list
ADD COLUMN timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP;

ALTER TABLE utilitySaga.eAccount_list
ADD COLUMN request_id INT NULL;



DELIMITER $$
CREATE TRIGGER update_electricity_meter_update
AFTER UPDATE ON utilitysaga.eAccount_list
FOR EACH ROW
BEGIN
    IF OLD.meter_status <> NEW.meter_status THEN
        INSERT INTO utilitysaga.electricity_regionaladmin_notification (title, recipientType, recipientId, `date`, subject, message)
        VALUES (
'Electricity Meter Status Update',
            'SPECIFIC',
            NEW.nic,
            CURRENT_TIMESTAMP,
            'IMPORTANT',
            CONCAT('Your meter status of account ', NEW.account_number , ' has been updated to status ', NEW.meter_status)
        );
    END IF;
END$$
DELIMITER ;




DELIMITER $$
CREATE TRIGGER update_eaccount_balance
    AFTER INSERT ON utilitysaga.electricity_manual_payment
    FOR EACH ROW
BEGIN
    UPDATE utilitysaga.eAccount_list
    SET balance = balance - NEW.amount
    WHERE account_number = NEW.account_number;
END$$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER update_balance_notification
    AFTER UPDATE ON utilitysaga.eAccount_list
    FOR EACH ROW
BEGIN
    IF OLD.balance <> NEW.balance THEN
        INSERT INTO utilitysaga.electricity_regionaladmin_notification (title, recipientType, recipientId, `date`, subject, message)
        VALUES (
                   'Balance Update',
                   'SPECIFIC',
                   NEW.nic,
                   CURRENT_TIMESTAMP,
                   'Balance Updated',
                   CONCAT('Your account balance for account ', NEW.account_number , ' has been updated to ', NEW.balance)
               );
    END IF;
END$$
DELIMITER ;



ALTER TABLE eAccount_list ADD COLUMN address VARCHAR(255) NOT NULL;
ALTER TABLE eAccount_list
ALTER COLUMN address SET DEFAULT '';


ALTER TABLE eAccount_list
ADD CONSTRAINT fk_eaccount_request_id FOREIGN KEY (request_id) REFERENCES electricity_connection_request(id);

CREATE TRIGGER update_water_connection_request
AFTER UPDATE ON water_connection_request
FOR EACH ROW
BEGIN
    IF OLD.account_status <> NEW.account_status THEN
        IF NEW.account_status = 'ADDED' THEN
            INSERT INTO water_regionaladmin_notification (title, recipientType, recipientId, `date`, subject, message)
            VALUES (
                CONCAT('Water Connection Request Update ID: ', NEW.id),
                'SPECIFIC',
                NEW.nic,
                CURRENT_TIMESTAMP,
                'IMPORTANT',
                CONCAT('Your request status has been updated to ', NEW.account_status, '. New account number: ', NEW.account_number)
            );
        ELSE
            INSERT INTO water_regionaladmin_notification (title, recipientType, recipientId, `date`, subject, message)
            VALUES (
                CONCAT('Water Connection Request Update ID: ', NEW.id),
                'SPECIFIC',
                NEW.nic,
                CURRENT_TIMESTAMP,
                'IMPORTANT',
                CONCAT('Your request status has been updated to ', NEW.account_status)
            );
        END IF;
    END IF;
END;

