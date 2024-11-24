use quanlykhohang;

INSERT INTO materials (code, name, unit, price) VALUES
('VT001', 'Xi măng', 'Bao', 80000),
('VT002', 'Gạch đỏ', 'Viên', 1500),
('VT003', 'Cát xây', 'Khối', 350000),
('VT004', 'Thép', 'Kg', 20000),
('VT005', 'Sơn', 'Lít', 120000);

INSERT INTO inventory (material_id, initial_quantity, total_quantity_imported, total_quantity_exported) VALUES
(1, 100, 50, 30),
(2, 2000, 500, 300),
(3, 50, 20, 10),
(4, 500, 200, 150),
(5, 100, 30, 20);

INSERT INTO supplier (code, name, address, phone_number) VALUES
('NCC001', 'Công ty A', 'Hà Nội', '0123456789'),
('NCC002', 'Công ty B', 'Hải Phòng', '0987654321'),
('NCC003', 'Công ty C', 'Đà Nẵng', '0909090909');

INSERT INTO orders (code, order_date, supplier_id) VALUES
('DDH001', '2024-11-01', 1),
('DDH002', '2024-11-05', 2),
('DDH003', '2024-11-10', 3);

INSERT INTO receipt (code, date, order_id) VALUES
('PN001', '2024-11-02', 1),
('PN002', '2024-11-06', 2),
('PN003', '2024-11-11', 3);

INSERT INTO delivery_note (date, customer_name) VALUES
('2024-11-15', 'Khách hàng A'),
('2024-11-16', 'Khách hàng B'),
('2024-11-17', 'Khách hàng C');

INSERT INTO order_detail (order_id, material_id, quantity) VALUES
(1, 1, 50),
(1, 2, 300),
(2, 3, 10),
(2, 4, 100),
(3, 5, 20),
(3, 1, 30);

INSERT INTO receipt_detail (receipt_id, material_id, quantity, price, note) VALUES
(1, 1, 50, 80000, 'Hàng đạt tiêu chuẩn'),
(1, 2, 300, 1500, 'Hàng đạt tiêu chuẩn'),
(2, 3, 10, 350000, 'Hàng đạt tiêu chuẩn'),
(2, 4, 100, 20000, 'Hàng đạt tiêu chuẩn'),
(3, 5, 20, 120000, 'Hàng đạt tiêu chuẩn'),
(3, 1, 30, 80000, 'Hàng đạt tiêu chuẩn');

INSERT INTO delivery_note_detail (delivery_note_id, material_id, quantity, price, note) VALUES
(1, 1, 30, 85000, 'Xuất cho công trình A'),
(1, 2, 200, 1600, 'Xuất cho công trình B'),
(2, 3, 5, 360000, 'Xuất cho công trình C'),
(2, 4, 50, 21000, 'Xuất cho công trình D'),
(3, 5, 10, 125000, 'Xuất cho công trình E'),
(3, 1, 20, 85000, 'Xuất cho công trình F');