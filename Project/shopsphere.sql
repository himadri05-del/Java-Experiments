CREATE DATABASE IF NOT EXISTS shopsphere CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE shopsphere;
CREATE TABLE IF NOT EXISTS users (
 user_id INT PRIMARY KEY AUTO_INCREMENT, name VARCHAR(100) NOT NULL, email VARCHAR(160) NOT NULL UNIQUE,
 password_hash VARCHAR(255) NOT NULL, mobile VARCHAR(20), role ENUM('CUSTOMER','ADMIN') NOT NULL DEFAULT 'CUSTOMER',
 created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
CREATE TABLE IF NOT EXISTS categories (
 category_id INT PRIMARY KEY AUTO_INCREMENT, name VARCHAR(80) NOT NULL UNIQUE
);
CREATE TABLE IF NOT EXISTS products (
 product_id INT PRIMARY KEY AUTO_INCREMENT, category_id INT, name VARCHAR(160) NOT NULL, brand VARCHAR(100),
 description TEXT, price DECIMAL(10,2) NOT NULL, discount DECIMAL(5,2) NOT NULL DEFAULT 0,
 stock INT NOT NULL DEFAULT 0, image_url VARCHAR(500), status TINYINT NOT NULL DEFAULT 1,
 created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP, FOREIGN KEY(category_id) REFERENCES categories(category_id)
);
CREATE TABLE IF NOT EXISTS orders (
 order_id INT PRIMARY KEY AUTO_INCREMENT, user_id INT NULL, customer_name VARCHAR(100) NOT NULL,
 email VARCHAR(160) NOT NULL, address_line VARCHAR(255) NOT NULL, city VARCHAR(80) NOT NULL,
 pincode VARCHAR(12) NOT NULL, total_amount DECIMAL(10,2) NOT NULL,
 payment_method VARCHAR(30) NOT NULL DEFAULT 'Cash on Delivery', payment_status VARCHAR(30) NOT NULL DEFAULT 'PENDING',
 order_status VARCHAR(30) NOT NULL DEFAULT 'PLACED', created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
CREATE TABLE IF NOT EXISTS order_items (
 order_item_id INT PRIMARY KEY AUTO_INCREMENT, order_id INT NOT NULL, product_id INT NOT NULL,
 product_name VARCHAR(160) NOT NULL, quantity INT NOT NULL, price DECIMAL(10,2) NOT NULL,
 FOREIGN KEY(order_id) REFERENCES orders(order_id), FOREIGN KEY(product_id) REFERENCES products(product_id)
);
INSERT IGNORE INTO categories(category_id,name) VALUES
(1,'Audio'),(2,'Wearables'),(3,'Computing'),(4,'Lifestyle'),(5,'Photography');
INSERT INTO products(product_id,category_id,name,brand,description,price,discount,stock,image_url,status) VALUES
(1,1,'Studio Wireless Headphones','SonicWave','Immersive sound, soft memory-foam earcups and all-day battery life.',5999,15,25,'https://images.unsplash.com/photo-1505740420928-5e560c06d30e?auto=format&fit=crop&w=900&q=85',1)
ON DUPLICATE KEY UPDATE name=VALUES(name);

INSERT INTO products(product_id,category_id,name,brand,description,price,discount,stock,image_url,status) VALUES
(2,2,'Pulse Smart Watch','Orbit','Track your activity, sleep and daily goals with a bright edge-to-edge display.',7499,12,18,'https://images.unsplash.com/photo-1523275335684-37898b6baf30?auto=format&fit=crop&w=900&q=85',1),
(3,3,'AirLite Laptop Stand','FormLab','A clean aluminium stand that lifts your workspace and improves posture.',2299,10,30,'https://images.unsplash.com/photo-1527864550417-7fd91fc51a46?auto=format&fit=crop&w=900&q=85',1),
(4,4,'Everyday Travel Backpack','Northline','Weather-resistant everyday backpack with a padded laptop compartment.',3199,18,22,'https://images.unsplash.com/photo-1553062407-98eeb64c6a62?auto=format&fit=crop&w=900&q=85',1),
(5,1,'Noise-Cancel Earbuds','SonicWave','Pocket-sized earbuds with rich bass, clear calls and a compact charging case.',3999,20,35,'https://images.unsplash.com/photo-1606220945770-b5b6c2c55bf1?auto=format&fit=crop&w=900&q=85',1),
(6,5,'Instant Mini Camera','Frame','Capture little moments with a playful instant-print camera.',6899,8,12,'https://images.unsplash.com/photo-1516035069371-29a1b244cc32?auto=format&fit=crop&w=900&q=85',1),
(7,3,'Mechanical Keyboard','KeyCraft','Tactile mechanical keys and a compact layout for focused work and play.',4599,10,16,'https://images.unsplash.com/photo-1587829741301-dc798b83add3?auto=format&fit=crop&w=900&q=85',1),
(8,4,'Ceramic Desk Lamp','FormLab','Warm ambient lighting with a minimal ceramic silhouette.',1899,5,20,'https://images.unsplash.com/photo-150 світ',1)
ON DUPLICATE KEY UPDATE name=VALUES(name);
