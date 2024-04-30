CREATE TABLE users(
    nic varchar(13) PRIMARY KEY CHECK (CHAR_LENGTH(nic) > 10),
    uname varchar(25) NOT NULL,
    firstname varchar(50) NOT NULL ,
    lastname varchar(50) NOT NULL ,
    pwd varchar(255) NOT NULL CHECK (CHAR_LENGTH(pwd) > 8),
    mobile varchar(20) NOT NULL CHECK ( mobile LIKE '[0-9]%[0-9]' AND CHAR_LENGTH(mobile) = 10),
    home varchar(20) CHECK ( home LIKE '[0-9]%[0-9]' AND CHAR_LENGTH(home) = 10),
    email varchar(255) NOT NULL CHECK ( email LIKE  '%_@_%._%' AND CHAR_LENGTH(email) < 255),
    address varchar(255) NOT NULL,
    provider ENUM('CEB', 'LECO'),
    region varchar(50) NOT NULL CHECK ( region LIKE '[a-z]%[a-z]' AND  CHAR_LENGTH(region) < 50),
    services SET('electricity', 'water', 'solar') NOT NULL
);

ALTER TABLE users
ADD CONSTRAINT unique_email_constraint UNIQUE (email);
