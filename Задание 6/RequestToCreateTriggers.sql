DELIMITER //

CREATE TRIGGER after_insert_audit
AFTER INSERT ON cartridge FOR EACH ROW
BEGIN
    INSERT INTO audit_table (audit_action, audit_timestamp, user, affected_row_id, table_name)
    VALUES ('INSERT', NOW(), USER(), NEW.id, 'cartridge');
END; //

CREATE TRIGGER after_insert_audit
AFTER INSERT ON cartridge_has_printer FOR EACH ROW
BEGIN
    INSERT INTO audit_table (audit_action, audit_timestamp, user, affected_row_id, table_name)
    VALUES ('INSERT', NOW(), USER(), NEW.id, 'cartridge_has_printer');
END; //

CREATE TRIGGER after_insert_audit
AFTER INSERT ON department FOR EACH ROW
BEGIN
    INSERT INTO audit_table (audit_action, audit_timestamp, user, affected_row_id, table_name)
    VALUES ('INSERT', NOW(), USER(), NEW.id, 'department');
END; //

CREATE TRIGGER after_insert_audit
AFTER INSERT ON employees FOR EACH ROW
BEGIN
    INSERT INTO audit_table (audit_action, audit_timestamp, user, affected_row_id, table_name)
    VALUES ('INSERT', NOW(), USER(), NEW.id, 'employees');
END; //

CREATE TRIGGER after_insert_audit
AFTER INSERT ON issuing FOR EACH ROW
BEGIN
    INSERT INTO audit_table (audit_action, audit_timestamp, user, affected_row_id, table_name)
    VALUES ('INSERT', NOW(), USER(), NEW.id, 'issuing');
END; //

CREATE TRIGGER after_insert_audit
AFTER INSERT ON printer FOR EACH ROW
BEGIN
    INSERT INTO audit_table (audit_action, audit_timestamp, user, affected_row_id, table_name)
    VALUES ('INSERT', NOW(), USER(), NEW.id, 'printer');
END; //

CREATE TRIGGER after_insert_audit
AFTER INSERT ON subordinate_employees FOR EACH ROW
BEGIN
    INSERT INTO audit_table (audit_action, audit_timestamp, user, affected_row_id, table_name)
    VALUES ('INSERT', NOW(), USER(), NEW.id, 'subordinate_employees');
END; //

CREATE TRIGGER after_insert_audit
AFTER INSERT ON supply FOR EACH ROW
BEGIN
    INSERT INTO audit_table (audit_action, audit_timestamp, user, affected_row_id, table_name)
    VALUES ('INSERT', NOW(), USER(), NEW.id, 'supply');
END; //


DELIMITER ;
