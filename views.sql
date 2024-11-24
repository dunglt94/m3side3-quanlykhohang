use quanlykhohang;

drop view v_delivery_note_detail;
drop view v_dnd_m;
drop view v_rd_m_r;
drop view v_rd_m_r_o;
drop view v_rc1;
drop view v_rd_m1;
drop view v_dnd;
drop view v_dnd_m;
drop view v_dnd_m_dn;

create view v_receipt_detail as
select receipt_id, material_id, quantity, price, (quantity * price) 'total price' 
from receipt_detail;

create view v_rd_m as
select r.receipt_id, m.id, m.name, r.quantity, r.price, (r.quantity * r.price) 'total price' 
from receipt_detail r
join materials m on r.material_id = m.id;

create view v_rd_m_r as
select rd.receipt_id, r.date, r.code, m.id, m.name, rd.quantity, rd.price, (rd.quantity * rd.price) 'total price' 
from receipt_detail rd
join receipt r on rd.receipt_id = r.id
join materials m on rd.material_id = m.id;

create view v_rd_m_r_o as
select rd.receipt_id, r.date, r.code, o.supplier_id, m.id, m.name, rd.quantity, rd.price, (rd.quantity * rd.price) 'total price' 
from receipt_detail rd
join receipt r on rd.receipt_id = r.id
join orders o on r.order_id = o.id
join materials m on rd.material_id = m.id;

create view v_rc1 as
select receipt_id, material_id, quantity, price, (quantity * price) 'total price' 
from receipt_detail
where quantity > 30;

create view v_rd_m1 as
select r.receipt_id, m.id, m.name, r.quantity, r.price, (r.quantity * r.price) 'total price' 
from receipt_detail r
join materials m on r.material_id = m.id
where m.unit = 'Kg';

create view v_dnd as
select delivery_note_id, material_id, quantity, price, (quantity * price) 'total price' 
from delivery_note_detail;

create view v_dnd_m as
select dd.delivery_note_id, m.id, m.name, dd.quantity, dd.price, (dd.quantity * dd.price) 'total price' 
from delivery_note_detail dd
join materials m on dd.material_id = m.id;

create view v_dnd_m_dn as
select dd.delivery_note_id, d.customer_name, m.id, m.name, dd.quantity, dd.price, (dd.quantity * dd.price) 'total price' 
from delivery_note_detail dd
join delivery_note d on dd.delivery_note_id = d.id
join materials m on dd.material_id = m.id;

select * from v_receipt_detail;
select * from v_rd_m;
select * from v_rd_m_r;
select * from v_rd_m_r_o;
select * from v_rc1;
select * from v_rd_m1;
select * from v_dnd;
select * from v_dnd_m;
select * from v_dnd_m_dn;