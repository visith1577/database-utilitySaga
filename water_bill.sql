CREATE TABLE water_bill (
    billId varchar(255) PRIMARY KEY,
    amount FLOAT NOT NULL,
    billedDate DATE NOT NULL,
    dueDate DATE DEFAULT (DATE_ADD(billedDate, INTERVAL 1 MONTH)),
    CHECK (dueDate >= billedDate)
);

ALTER TABLE  water_bill
ADD COLUMN status ENUM('PAID', 'PENDING', 'OVERDUE') NOT NULL;
ALTER TABLE water_bill
ADD COLUMN account_number varchar(255) NOT NULL;
ALTER TABLE water_bill
ADD CONSTRAINT fw_key FOREIGN KEY (account_number) REFERENCES wAccount_list(account_number);