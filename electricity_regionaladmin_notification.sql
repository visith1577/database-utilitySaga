CREATE TABLE electricity_regionaladmin_notification
(
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(50),
    recipientType ENUM('ALL', 'SPECIFIC') NOT NULL,
    recipientId VARCHAR(25) NULL, -- User ID if recipient_type is 'specific', NULL if 'all'
    date VARCHAR(25) NOT NULL,
    subject VARCHAR(50),
    message VARCHAR(500)
);