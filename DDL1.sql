Server [localhost]:
Database [postgres]:
Port [5432]:
Username [postgres]:
Password for user postgres:
psql (15.4)
WARNING: Console code page (437) differs from Windows code page (1252)
         8-bit characters might not work correctly. See psql reference
         page "Notes for Windows users" for details.
Type "help" for help.

postgres=# CREATE DATABASE STOCK
postgres-# ;
CREATE DATABASE
postgres=# \c stock ;
You are now connected to database "stock" as user "postgres".
stock=# CREATE TABLE tbl_stocks(
stock(#     pk_int_stock_id SERIAL PRIMARY KEY,
stock(#     vchr_name   VARCHAR,
stock(#     int_quantity INT,
stock(#     int_price INT
stock(# );
CREATE TABLE

stock=# \d tbl_stocks;
                                            Table "public.tbl_stocks"
     Column      |       Type        | Collation | Nullable |
            Default
-----------------+-------------------+-----------+----------+-----------------------------------------------------
 pk_int_stock_id | integer           |           | not null | nextval('tbl_stocks_pk_int_stock_id_seq'::regclass)
 vchr_name       | character varying |           |          |
 int_quantity    | integer           |           |          |
 int_price       | integer           |           |          |
Indexes:
    "tbl_stocks_pkey" PRIMARY KEY, btree (pk_int_stock_id)

stock=# ALTER TABLE tbl_stocks
stock-# ALTER COLUMN int_price TYPE FLOAT;
ALTER TABLE
stock=# \d tbl_stocks;
                                            Table "public.tbl_stocks"
     Column      |       Type        | Collation | Nullable |
            Default
-----------------+-------------------+-----------+----------+-----------------------------------------------------
 pk_int_stock_id | integer           |           | not null | nextval('tbl_stocks_pk_int_stock_id_seq'::regclass)
 vchr_name       | character varying |           |          |
 int_quantity    | integer           |           |          |
 int_price       | double precision  |           |          |
Indexes:
    "tbl_stocks_pkey" PRIMARY KEY, btree (pk_int_stock_id)

stock=# CREATE TABLE tbl_supplier(
stock(#     pk_int_supplier_id SERIAL PRIMARY KEY,
stock(#     vchr_supplier_name VARCHAR(50)
stock(# );
CREATE TABLE

stock=# \d tbl_supplier;
                                                 Table "public.tbl_supplier"
       Column       |         Type          | Collation | Nullable |                         Default
--------------------+-----------------------+-----------+----------+----------------------------------------------------------
 pk_int_supplier_id | integer               |           | not null | nextval('tbl_supplier_pk_int_supplier_id_seq'::regclass)
 vchr_supplier_name | character varying(50) |           |          |
Indexes:
    "tbl_supplier_pkey" PRIMARY KEY, btree (pk_int_supplier_id)

stock=# ALTER TABLE tbl_stocks
stock-# ADD COLUMN fk_int_supplier INT;
ALTER TABLE    

stock=# ALTER TABLE tbl_stocks
stock-# ADD CONSTRAINT fk_int_supplier
stock-# FOREIGN KEY(fk_int_supplier)REFERENCES tbl_supplier(pk_int_supplier_id)
stock-# ON DELETE CASCADE ON UPDATE CASCADE  ;
ALTER TABLE

stock=# \d tbl_stocks;
                                            Table "public.tbl_stocks"
     Column      |       Type        | Collation | Nullable |
            Default
-----------------+-------------------+-----------+----------+-----------------------------------------------------
 pk_int_stock_id | integer           |           | not null | nextval('tbl_stocks_pk_int_stock_id_seq'::regclass)
 vchr_name       | character varying |           |          |
 int_quantity    | integer           |           |          |
 int_price       | double precision  |           |          |
 fk_int_supplier | integer           |           |          |
Indexes:
    "tbl_stocks_pkey" PRIMARY KEY, btree (pk_int_stock_id)
Foreign-key constraints:
    "fk_int_supplier" FOREIGN KEY (fk_int_supplier) REFERENCES tbl_supplier(pk_int_supplier_id) ON UPDATE CASCADE ON DELETE CASCADE

stock=# CREATE TABLE tbl_dep(
stock(#     pk_int_dept_id  SERIAL PRIMARY KEY,
stock(#     vchr_dept_name VARCHAR(50)
stock(# );
CREATE TABLE
stock=# \d tbl_dep;
                                             Table "public.tbl_dep"
     Column     |         Type          | Collation | Nullable |                     Default
----------------+-----------------------+-----------+----------+-------------------------------------------------
 pk_int_dept_id | integer               |           | not null | nextval('tbl_dep_pk_int_dept_id_seq'::regclass)
 vchr_dept_name | character varying(50) |           |          |
Indexes:
    "tbl_dep_pkey" PRIMARY KEY, btree (pk_int_dept_id)

stock=# CREATE TABLE tbl_classes(
stock(#     pk_int_class_id SERIAL PRIMARY KEY,
stock(#     vchr_class_name VARCHAR(20),
stock(#     fk_int_dept_id  INT,
stock(#      FOREIGN KEY(fk_int_dept_id)REFERENCES tbl_dep(pk_int_dept_id)
stock(#     ON DELETE CASCADE ON UPDATE CASCADE
stock(# );
CREATE TABLE

stock=# \d tbl_classes;
                                              Table "public.tbl_classes"
     Column      |         Type          | Collation | Nullable |                       Default
-----------------+-----------------------+-----------+----------+------------------------------------------------------
 pk_int_class_id | integer               |           | not null | nextval('tbl_classes_pk_int_class_id_seq'::regclass)
 vchr_class_name | character varying(20) |           |          |  fk_int_dept_id  | integer               |           |          | Indexes:
    "tbl_classes_pkey" PRIMARY KEY, btree (pk_int_class_id)
Foreign-key constraints:
    "tbl_classes_fk_int_dept_id_fkey" FOREIGN KEY (fk_int_dept_id) REFERENCES tbl_dep(pk_int_dept_id) ON UPDATE CASCADE ON DELETE CASCADE




stock=# CREATE TABLE tbl_enrollment(
stock(#     pk_int_entrollment_id SERIAL PRIMARY KEY,
stock(#     int_count INT,
stock(#     fk_int_class_id INT,
stock(#      FOREIGN KEY(fk_int_class_id)REFERENCES tbl_classes(pk_int_class_id)
stock(#     ON DELETE CASCADE ON UPDATE CASCADE
stock(# );
CREATE TABLE
stock=# \d tbl_enrollment;
                                             Table "public.tbl_enrollment"
        Column         |  Type   | Collation | Nullable |
             Default
-----------------------+---------+-----------+----------+---------------------------------------------------------------
 pk_int_entrollment_id | integer |           | not null | nextval('tbl_enrollment_pk_int_entrollment_id_seq'::regclass)
 int_count             | integer |           |          |
 fk_int_class_id       | integer |           |          |
Indexes:
    "tbl_enrollment_pkey" PRIMARY KEY, btree (pk_int_entrollment_id)
Foreign-key constraints:
    "tbl_enrollment_fk_int_class_id_fkey" FOREIGN KEY (fk_int_class_id) REFERENCES tbl_classes(pk_int_class_id) ON UPDATE CASCADE ON DELETE CASCADE


stock=# ALTER TABLE tbl_classes
stock-# ADD CONSTRAINT unique_class_name UNIQUE (vchr_class_name);
ALTER TABLE
stock=# \d tbl_classes;
                                              Table "public.tbl_classes"     Column      |         Type          | Collation | Nullable |                       Default
-----------------+-----------------------+-----------+----------+------------------------------------------------------
 pk_int_class_id | integer               |           | not null | nextval('tbl_classes_pk_int_class_id_seq'::regclass)
 vchr_class_name | character varying(20) |           |          |
 fk_int_dept_id  | integer               |           |          |
Indexes:
    "tbl_classes_pkey" PRIMARY KEY, btree (pk_int_class_id)
    "unique_class_name" UNIQUE CONSTRAINT, btree (vchr_class_name)
Foreign-key constraints:
    "tbl_classes_fk_int_dept_id_fkey" FOREIGN KEY (fk_int_dept_id) REFERENCES tbl_dep(pk_int_dept_id) ON UPDATE CASCADE ON DELETE CASCADE
Referenced by:
    TABLE "tbl_enrollment" CONSTRAINT "tbl_enrollment_fk_int_class_id_fkey" FOREIGN KEY (fk_int_class_id) REFERENCES tbl_classes(pk_int_class_id) ON UPDATE CASCADE ON DELETE CASCADE



stock=# ALTER TABLE tbl_dep ADD vchr_dept_description VARCHAR(100);
ALTER TABLE
stock=# \d tbl_dep;
                                                 Table "public.tbl_dep"
        Column         |          Type          | Collation | Nullable |                     Default
-----------------------+------------------------+-----------+----------+-------------------------------------------------
 pk_int_dept_id        | integer                |           | not null | nextval('tbl_dep_pk_int_dept_id_seq'::regclass)
 vchr_dept_name        | character varying(50)  |           |          |

 vchr_dept_description | character varying(100) |           |          |

Indexes:
    "tbl_dep_pkey" PRIMARY KEY, btree (pk_int_dept_id)
Referenced by:
    TABLE "tbl_classes" CONSTRAINT "tbl_classes_fk_int_dept_id_fkey" FOREIGN KEY (fk_int_dept_id) REFERENCES tbl_dep(pk_int_dept_id) ON UPDATE CASCADE ON DELETE CASCADE

stock=# INSERT INTO tbl_supplier VALUES
stock-#    (1,'Logitech') ,
stock-#    (2,'Samasung'),
stock-#    (3,'Iball'),
stock-#    (4,'LG'),
stock-#    (5,'Creative');
INSERT 0 5
stock=# select * from tbl_supplier;
 pk_int_supplier_id | vchr_supplier_name
--------------------+--------------------
                  1 | Logitech
                  2 | Samasung
                  3 | Iball
                  4 | LG
                  5 | Creative
(5 rows)
