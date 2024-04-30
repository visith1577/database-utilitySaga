CREATE TABLE meter_reader(
    id INT AUTO_INCREMENT primary key,
    value varchar(255),
    timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);