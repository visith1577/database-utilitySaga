CREATE TABLE water_manual_payment
(
    mpaymentid  INT AUTO_INCREMENT PRIMARY KEY,
    account_number   varchar(50)      NOT NULL,
    nic              varchar(13)      NOT NULL,
    amount           varchar(255)     NOT NULL,
    date             DATE             NOT NULL
);