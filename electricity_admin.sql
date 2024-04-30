CREATE TABLE electricity_admin (
  id INT AUTO_INCREMENT PRIMARY KEY,
  region VARCHAR(255) NOT NULL,
  contact_number VARCHAR(255) NOT NULL,
  email VARCHAR(255) NOT NULL UNIQUE,
  password VARCHAR(255) NOT NULL,
  utilityType VARCHAR(255) NOT NULL,
  empid VARCHAR(50) NOT NULL UNIQUE,
  uname VARCHAR(25) NOT NULL,
  firstname VARCHAR(50) NOT NULL,
  lastname VARCHAR(50) NOT NULL,
  role ENUM('MAIN', 'REGIONAL') NOT NULL,
  mobile VARCHAR(20) NOT NULL,
  CONSTRAINT check_email CHECK (email REGEXP '^[\\w-]+@[\\w-]+\\.[\\w-]{2,}$'),
  CONSTRAINT check_role CHECK (role IN ('MAIN', 'REGIONAL'))
);

ALTER TABLE electricity_admin
DROP CONSTRAINT check_email;

ALTER TABLE electricity_admin
ADD CONSTRAINT check_email
CHECK (email REGEXP '^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,}$');

ALTER TABLE electricity_admin
ALTER COLUMN region SET DEFAULT 'HEADOFFICE';

ALTER TABLE electricity_admin
ADD CONSTRAINT unique_region
UNIQUE (region);

ALTER TABLE utilitysaga.electricity_admin
ADD COLUMN activate_status ENUM('ACTIVE', 'INACTIVE') NOT NULL DEFAULT 'ACTIVE';


ALTER TABLE electricity_admin
ADD FOREIGN KEY (region) REFERENCES electricity_region(region);
