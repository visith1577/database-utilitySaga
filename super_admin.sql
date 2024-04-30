CREATE TABLE super_admin(
    nic varchar(13) PRIMARY KEY CHECK (CHAR_LENGTH(nic) > 10),
    uname varchar(25) NOT NULL,
    pwd varchar(255) NOT NULL CHECK (CHAR_LENGTH(pwd) > 8),
    region varchar(25) NOT NULL,
    role varchar(25) NOT NULL
);

INSERT INTO super_admin (nic, uname, pwd, region, role)
VALUES ('200130704297', 'admin', 'Admin@utilitysaga', 'SUPERADMIN', 'SUPERADMIN');

DELETE FROM super_admin WHERE nic ='200130704297';

INSERT INTO super_admin (nic, uname, pwd, region, role)
VALUES ('200130704296', 'SUPERADMIN', 'Admin@utilitysaga', 'SUPERADMIN', 'SUPERADMIN');