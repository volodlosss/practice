CREATE DATABASE Tourism;
USE Tourism;

-- 1. Страны
CREATE TABLE Countries (
    country_id INT AUTO_INCREMENT PRIMARY KEY,
    country_name VARCHAR(100) NOT NULL
);

-- 2. Отели
CREATE TABLE Hotels (
    hotel_id INT AUTO_INCREMENT PRIMARY KEY,
    hotel_name VARCHAR(150) NOT NULL,
    country_id INT NOT NULL,
    FOREIGN KEY (country_id) REFERENCES Countries(country_id)
);

-- 3. Типы туров
CREATE TABLE TourTypes (
    tour_type_id INT AUTO_INCREMENT PRIMARY KEY,
    tour_type_name VARCHAR(100) NOT NULL
);

-- 4. Клиенты
CREATE TABLE Clients (
    client_id INT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(150) NOT NULL,
    phone VARCHAR(20),
    email VARCHAR(100)
);

-- 5. Заказы
CREATE TABLE Orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    client_id INT NOT NULL,
    hotel_id INT NOT NULL,
    tour_type_id INT NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    total_price DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (client_id) REFERENCES Clients(client_id),
    FOREIGN KEY (hotel_id) REFERENCES Hotels(hotel_id),
    FOREIGN KEY (tour_type_id) REFERENCES TourTypes(tour_type_id)
);
