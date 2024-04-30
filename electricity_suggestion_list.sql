CREATE TABLE eSuggestion_list(
    id INT AUTO_INCREMENT PRIMARY KEY,
    account_number varchar(255) NOT NULL,
    data_item VARCHAR(255),
    FOREIGN KEY (account_number) REFERENCES eAccount_list(account_number)
);