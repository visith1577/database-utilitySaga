CREATE TABLE water_admin(
  id INT AUTO_INCREMENT PRIMARY KEY,
  region VARCHAR(255) NOT NULL,
  contact_number VARCHAR(255) NOT NULL,
  email VARCHAR(255) NOT NULL UNIQUE,
  password VARCHAR(255) NOT NULL,
  empid VARCHAR(50) NOT NULL UNIQUE,
  uname VARCHAR(25) NOT NULL,
  firstname VARCHAR(50) NOT NULL,
  lastname VARCHAR(50) NOT NULL,
  role ENUM('MAIN', 'REGIONAL') NOT NULL,
  mobile VARCHAR(20) NOT NULL,
  CONSTRAINT check_email_water CHECK (email REGEXP '^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,}$'),
  CONSTRAINT check_role_water CHECK (role IN ('MAIN', 'REGIONAL'))
);

DELETE from water_admin WHERE region = 'WDematagoda';

ALTER TABLE water_admin
ALTER COLUMN region SET DEFAULT 'HEADOFFICE';

ALTER TABLE utilitysaga.water_admin
ADD COLUMN activate_status ENUM('ACTIVE', 'INACTIVE') NOT NULL DEFAULT 'ACTIVE';
