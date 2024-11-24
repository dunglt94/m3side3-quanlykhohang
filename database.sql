create database QuanLyKhoHang;

use QuanLyKhoHang;

CREATE TABLE materials (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    code VARCHAR(10),
    name VARCHAR(100),
    unit VARCHAR(15),
    price DECIMAL(15, 2)
    );
    
    CREATE TABLE inventory (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    material_id INT,
    initial_quantity INT,
    total_quantity_imported INT,
    total_quantity_exported INT,
    FOREIGN KEY (material_id) REFERENCES materials(id)
);

CREATE TABLE Supplier (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    code VARCHAR(10),
    name VARCHAR(100),
    address VARCHAR(150),
    phone_number VARCHAR(10)
);

CREATE TABLE Orders (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    code VARCHAR(10),
    order_date DATE,
    supplier_id INT,
    FOREIGN KEY (supplier_id) REFERENCES Supplier(id)
);

CREATE TABLE Receipt (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    code VARCHAR(10),
    date DATE,
    order_id INT,
    FOREIGN KEY (order_id) REFERENCES Orders(id)
);

CREATE TABLE delivery_note (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    date DATE,
    customer_name VARCHAR(100)
);

CREATE TABLE order_detail (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    order_id INT,
    material_id INT,
    quantity INT,
    FOREIGN KEY (order_id) REFERENCES Orders(id),
    FOREIGN KEY (material_id) REFERENCES materials(id)
);

CREATE TABLE Receipt_detail (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    receipt_id INT,
    material_id INT,
    quantity INT,
    price DECIMAL(15, 2),
    note TEXT,
    FOREIGN KEY (receipt_id) REFERENCES Receipt(id),
    FOREIGN KEY (material_id) REFERENCES Materials(id)
);

CREATE TABLE Delivery_Note_detail (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    delivery_note_id INT,
    material_id INT,
    quantity INT,
    price DECIMAL(15, 2),
    note TEXT,
    FOREIGN KEY (delivery_note_id) REFERENCES delivery_note(id),
    FOREIGN KEY (material_id) REFERENCES Materials(id)
);

