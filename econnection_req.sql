CREATE TABLE electricity_connection_request(
    id INT AUTO_INCREMENT PRIMARY KEY,
    requester_name varchar(255) NOT NULL,
    account_number varchar(50) DEFAULT 'No Account',
    nic varchar(13) NOT NULL,
    email varchar(255) NOT NULL CHECK ( email LIKE  '%_@_%._%' AND CHAR_LENGTH(email) < 255),
    mobile varchar(20) NOT NULL CHECK (CHAR_LENGTH(mobile) = 10),
    region varchar(50) NOT NULL CHECK ( region NOT LIKE '%[^A-Z]%' AND  CHAR_LENGTH(region) < 50),
    current_address varchar(255) NOT NULL,
    new_address varchar(255) NOT NULL,
    nearest_account varchar(50) default 'No Account',
    connection_requirement ENUM('CONNECTION', 'DISCONNECTION') NOT NULL,
    connection_type
        ENUM('Single phase 30A', 'Three phase 30A', 'Three Phase 60A', 'Single phase 15A', 'Three Phase 15A')
        DEFAULT 'Single phase 30A'
);

ALTER TABLE electricity_connection_request ADD COLUMN account_status ENUM('ADDED', 'REJECTED', 'PENDING') NOT NULL DEFAULT 'PENDING';

ALTER TABLE water_connection_request ADD COLUMN account_status ENUM('ADDED', 'REJECTED', 'PENDING') NOT NULL DEFAULT 'PENDING';

ALTER TABLE electricity_connection_request
ADD COLUMN date TIMESTAMP;

CREATE TRIGGER update_electricity_connection_request
AFTER UPDATE ON electricity_connection_request
FOR EACH ROW
BEGIN
    IF OLD.account_status <> NEW.account_status THEN
        IF NEW.account_status = 'ADDED' THEN
            INSERT INTO electricity_regionaladmin_notification (title, recipientType, recipientId, `date`, subject, message)
            VALUES (
                CONCAT('Electricity Connection Request Update ID: ', NEW.id),
                'SPECIFIC',
                NEW.nic,
                CURRENT_TIMESTAMP,
                'IMPORTANT',
                CONCAT('Your request status has been updated to ', NEW.account_status, '. New account number: ', NEW.account_number)
            );
        ELSE
            INSERT INTO electricity_regionaladmin_notification (title, recipientType, recipientId, `date`, subject, message)
            VALUES (
                CONCAT('Electricity Connection Request Update ID: ', NEW.id),
                'SPECIFIC',
                NEW.nic,
                CURRENT_TIMESTAMP,
                'IMPORTANT',
                CONCAT('Your request status has been updated to ', NEW.account_status)
            );
        END IF;
    END IF;
END;
