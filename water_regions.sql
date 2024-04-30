CREATE TABLE water_region (
    id INT AUTO_INCREMENT NOT NULL UNIQUE,
    region VARCHAR(255) PRIMARY KEY
);

ALTER TABLE water_admin
ADD FOREIGN KEY (region) REFERENCES water_region(region);

ALTER TABLE wAccount_list
ADD FOREIGN KEY (region) REFERENCES water_region(region);

ALTER TABLE users
ADD FOREIGN KEY (region) REFERENCES water_region(region);

ALTER TABLE water_connection_request
ADD FOREIGN KEY (region) REFERENCES water_region(region);

SELECT DISTINCT region
FROM utilitysaga.water_connection_request
WHERE region NOT IN (SELECT region FROM utilitysaga.water_region);

ALTER TABLE wAccount_list
ADD CONSTRAINT fk_waccount_request_id FOREIGN KEY (request_id) REFERENCES water_connection_request(id);
