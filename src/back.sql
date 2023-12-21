CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    userType VARCHAR(255),
    username VARCHAR(255),
    password VARCHAR(255)
);

INSERT INTO users (userType, username, password) VALUES
    ('donator', 'john_doe', 'password123'),
    ('recycler', 'jane_doe', 'securepass');
