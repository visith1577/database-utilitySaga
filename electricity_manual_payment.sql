CREATE TABLE electricity_manual_payment
(
    mpaymentid  INT AUTO_INCREMENT PRIMARY KEY,
    account_number   varchar(50)      NOT NULL,
    nic              varchar(13)      NOT NULL,
    amount           varchar(255)     NOT NULL,
    date             DATE             NOT NULL
);

CREATE TRIGGER update_eaccount_balance
    AFTER INSERT ON utilitysaga.electricity_manual_payment
    FOR EACH ROW
BEGIN
    UPDATE utilitysaga.eAccount_list
    SET balance = balance - NEW.amount
    WHERE account_number = NEW.account_number;
END;