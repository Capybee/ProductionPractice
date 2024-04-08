use cartridges_db;

CREATE TABLE audit_table (
    id int auto_increment primary key,
    action varchar(50),
    audit_timestamp timestamp default current_timestamp,
    table_name varchar(60)
);
