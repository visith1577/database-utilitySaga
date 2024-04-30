CREATE TABLE electricity_bill (
    billId varchar(255) PRIMARY KEY,
    amount FLOAT NOT NULL,
    billedDate DATE NOT NULL,
    dueDate DATE DEFAULT (DATE_ADD(billedDate, INTERVAL 1 MONTH) ) NOT NULL,
    CHECK (dueDate >= billedDate)
);

ALTER TABLE  electricity_bill
ADD COLUMN status ENUM('PAID', 'PENDING', 'OVERDUE') NOT NULL;
ALTER TABLE electricity_bill
ADD COLUMN account_number varchar(255) NOT NULL;
ALTER TABLE electricity_bill
ADD CONSTRAINT fe_key FOREIGN KEY (account_number) REFERENCES eAccount_list(account_number);