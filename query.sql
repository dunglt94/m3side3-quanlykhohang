use quanlykhohang;

DROP PROCEDURE getFinalQuantity;
DROP PROCEDURE getTotalExportedPrice;
DROP PROCEDURE getImportedQuantity;
DROP PROCEDURE makeNewOrder;
DROP PROCEDURE makeNewOrderDetail;
DROP PROCEDURE removeSupplier;

DELIMITER $
CREATE PROCEDURE getFinalQuantity(IN _material_id int)
BEGIN
	Select m.name, (i.initial_quantity + i.total_quantity_imported - i.total_quantity_exported) 'final quantity'
    from inventory i
    join materials m on i.material_id = m.id
    where i.material_id = _material_id;
END $
DELIMITER ;

DELIMITER $
CREATE PROCEDURE getTotalExportedPrice(IN _material_id int)
BEGIN
	Select m.name, sum(dd.quantity * dd.price) 'Total price of exported material'
    from delivery_note_detail dd
    join materials m on dd.material_id = m.id
    where dd.material_id = _material_id
    group by dd.material_id;
END $
DELIMITER ;

DELIMITER $
CREATE PROCEDURE getImportedQuantity(IN _order_id int)
BEGIN
	Select m.name, od.quantity 'Imported material', m.unit
    from order_detail od
    join materials m on od.material_id = m.id
    where od.order_id = _order_id;
END $
DELIMITER ;

DELIMITER $
CREATE PROCEDURE makeNewOrder(
IN _code varchar(10),
IN _order_date date,
IN _supplier_id int
)
BEGIN
	insert into orders (code, order_date, supplier_id) values
    (_code, _order_date, _supplier_id);
END $
DELIMITER ;

DELIMITER $
CREATE PROCEDURE makeNewOrderDetail(
IN _order_id int,
IN _material_id int,
IN _quantity int
)
BEGIN
	insert into order_detail (order_id, material_id, quantity) values
    (_order_id, _material_id, _quantity);
END $
DELIMITER ;

DELIMITER $
CREATE PROCEDURE removeSupplier(IN _supplier_id int)
BEGIN
	update orders
    set supplier_id = null
    where supplier_id = _supplier_id;
    
    delete from supplier
    where id = _supplier_id;
END $
DELIMITER ;

call getFinalQuantity(1);
call getTotalExportedPrice(1);
call getImportedQuantity(1);
call makeNewOrder('DDH004', '2024-11-24', 1);
call makeNewOrderDetail(4, 1, 100);
call removeSupplier(3);