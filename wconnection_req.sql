CREATE TABLE water_connection_request(
    id INT AUTO_INCREMENT PRIMARY KEY,
    requester_name varchar(255) NOT NULL,
    account_number varchar(50) DEFAULT 'No Account',
    nic varchar(13) NOT NULL,
    email varchar(255) NOT NULL CHECK ( email LIKE  '%_@_%._%' AND CHAR_LENGTH(email) < 255),
    mobile varchar(20) NOT NULL CHECK (CHAR_LENGTH(mobile) = 10),
    region varchar(50) NOT NULL CHECK ( region NOT LIKE '%[^A-Z]%' AND  CHAR_LENGTH(region) < 50),
    current_address varchar(255) NOT NULL,
    new_address varchar(255),
    nearest_account varchar(50) default 'No Account',
    connection_type ENUM('CONNECTION', 'DISCONNECTION') NOT NULL
);

ALTER TABLE water_connection_request
ADD COLUMN date TIMESTAMP;

CREATE TRIGGER update_water_meter_update
AFTER UPDATE ON wAccount_list
FOR EACH ROW
BEGIN
    IF OLD.meter_status <> NEW.meter_status THEN
        INSERT INTO water_regionaladmin_notification (title, recipientType, recipientId, `date`, subject, message)
        VALUES (
'Water Meter Status Update',
            'SPECIFIC',
            NEW.nic,
            CURRENT_TIMESTAMP,
            'IMPORTANT',
            CONCAT('Your meter status of account ', NEW.account_number , ' has been updated to status ', NEW.meter_status)
        );
    END IF;
END