CREATE TABLE water_regionaladmin_notification
(
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(50),
    recipientType ENUM('ALL', 'SPECIFIC') NOT NULL,
    recipientId VARCHAR(25) NULL,
    date TIMESTAMP NOT NULL,
    subject VARCHAR(100),
    message VARCHAR(500)
);
