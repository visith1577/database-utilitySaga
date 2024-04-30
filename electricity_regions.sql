CREATE TABLE electricity_region (
    id INT AUTO_INCREMENT NOT NULL UNIQUE,
    region VARCHAR(255) PRIMARY KEY
);

ALTER TABLE electricity_admin
ADD FOREIGN KEY (region) REFERENCES electricity_region(region);

ALTER TABLE eAccount_list
ADD FOREIGN KEY (region) REFERENCES electricity_region(region);

ALTER TABLE users
ADD FOREIGN KEY (region) REFERENCES electricity_region(region);

ALTER TABLE electricity_connection_request
ADD FOREIGN KEY (region) REFERENCES electricity_region(region);

SELECT DISTINCT region
FROM utilitysaga.electricity_connection_request
WHERE region NOT IN (SELECT region FROM utilitysaga.electricity_region);

