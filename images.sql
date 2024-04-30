CREATE TABLE images (
    nic varchar(13) PRIMARY KEY CHECK (CHAR_LENGTH(nic) > 10),
    filename VARCHAR(255),
    content_type VARCHAR(100),
    data LONGBLOB
);