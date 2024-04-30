CREATE TABLE superadmin_notification(
    title   varchar(100)  NOT NULL,
    type    ENUM ('ELECTRICITY','WATER','SOLAR') NOT NULL,
    subject varchar(100) NOT NULL,
    message varchar(100) NOT NULL
);