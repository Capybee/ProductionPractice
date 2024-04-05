INSERT INTO cartridge_has_printer (cartridge_id, printer_id) 
VALUES 
(1, 3),
(1, 4),
(2, 2),
(3, 1),
(2, 1),
(3, 2);

insert into subordinate_employees (FIO, department_id) values ('Ангелова Т.Ю', 2), ('Яшина О.Ю.', 1);

insert into supply (date, count, cartridge_id, employees_id) values ('2024-02-10', 20, 1, 1), ('2024-02-10', 20, 2, 1), ('2024-02-10', 20, 3, 1);

insert into issuing (date, employees_id, subordinate_employees_id, subordinate_employees_department_id, cartridge_id) values ('2024-04-02', 2, 1, 2, 1); 