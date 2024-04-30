CREATE TABLE electricity_summary(
    nic varchar(13) PRIMARY KEY CHECK (CHAR_LENGTH(nic) > 10),
    data JSON NOT NULL,
    timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

ALTER TABLE electricity_summary
ADD COLUMN account_number varchar(255);

ALTER TABLE electricity_summary
DROP PRIMARY KEY,
ADD PRIMARY KEY (account_number);

ALTER TABLE electricity_summary
ADD FOREIGN KEY (nic) REFERENCES users(nic);


CREATE PROCEDURE DeleteOldEntriesOfElectricitySummary()
BEGIN
    DELETE FROM electricity_summary WHERE timestamp < DATE_SUB(NOW(), INTERVAL 1 DAY);
END;

CREATE EVENT IF NOT EXISTS DeleteOldEntriesEvent
ON SCHEDULE EVERY 1 DAY
STARTS TIMESTAMP(NOW() + INTERVAL 1 DAY)
DO
    CALL DeleteOldEntriesOfElectricitySummary();