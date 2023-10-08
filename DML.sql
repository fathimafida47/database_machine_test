stock=# INSERT INTO tbl_stocks VALUES
stock-# (1,'Mouse',10,500,1),
stock-# (2,'Keyboard',5,450,3),
stock-# (3,'Modern',10,1200,2),
stock-# (4,'Memory',100,1500,5),
stock-# (5,'Headphone',50,750,4),
stock-# (6,'Memory',2,3500,4);
INSERT 0 6
stock=# select * from tbl_stocks;
 pk_int_stock_id | vchr_name | int_quantity | int_price | fk_int_supplier
-----------------+-----------+--------------+-----------+-----------------
               1 | Mouse     |           10 |       500 |               1
               2 | Keyboard  |            5 |       450 |               3
               3 | Modern    |           10 |      1200 |               2
               4 | Memory    |          100 |      1500 |               5
               5 | Headphone |           50 |       750 |               4
               6 | Memory    |            2 |      3500 |               4
(6 rows)


stock=# UPDATE tbl_stocks SET int_price = 501.5 WHERE pk_int_stock_id = 1;
UPDATE 1
stock=# UPDATE tbl_stocks SET int_price = 451.5 WHERE pk_int_stock_id = 2;
UPDATE 1
stock=# UPDATE tbl_stocks SET int_price = 1201.5 WHERE pk_int_stock_id = 3;
UPDATE 1
stock=# UPDATE tbl_stocks SET int_price = 1501.5 WHERE pk_int_stock_id = 4;
UPDATE 1
stock=# UPDATE tbl_stocks SET int_price = 751.5 WHERE pk_int_stock_id = 5;
UPDATE 1
stock=# UPDATE tbl_stocks SET int_price = 3501.5 WHERE pk_int_stock_id = 6;
UPDATE 1

 pk_int_stock_id | vchr_name | int_quantity | int_price | fk_int_supplier
-----------------+-----------+--------------+-----------+-----------------
               1 | Mouse     |           10 |     501.5 |               1
               2 | Keyboard  |            5 |     451.5 |               3
               3 | Modern    |           10 |    1201.5 |               2
               4 | Memory    |          100 |    1501.5 |               5
               5 | Headphone |           50 |     751.5 |               4
               6 | Memory    |            2 |    3501.5 |               4
(6 rows)

stock=# SELECT * FROM tbl_stocks WHERE int_price >1000;
 pk_int_stock_id | vchr_name | int_quantity | int_price | fk_int_supplier
-----------------+-----------+--------------+-----------+-----------------
               3 | Modern    |           10 |    1201.5 |               2
               4 | Memory    |          100 |    1501.5 |               5
               6 | Memory    |            2 |    3501.5 |               4
(3 rows)

stock=# SELECT * FROM tbl_stocks
stock-# ORDER BY vchr_name ASC;
 pk_int_stock_id | vchr_name | int_quantity | int_price | fk_int_supplier
-----------------+-----------+--------------+-----------+-----------------
               5 | Headphone |           50 |     751.5 |               4
               2 | Keyboard  |            5 |     451.5 |               3
               4 | Memory    |          100 |    1501.5 |               5
               6 | Memory    |            2 |    3501.5 |               4
               3 | Modern    |           10 |    1201.5 |               2
               1 | Mouse     |           10 |     501.5 |               1
(6 rows)

stock=# SELECT * FROM tbl_stocks
stock-# ORDER BY vchr_name
stock-# LIMIT 3;
 pk_int_stock_id | vchr_name | int_quantity | int_price | fk_int_supplier
-----------------+-----------+--------------+-----------+-----------------
               5 | Headphone |           50 |     751.5 |               4
               2 | Keyboard  |            5 |     451.5 |               3
               4 | Memory    |          100 |    1501.5 |               5
(3 rows)
  

stock=# SELECT *
stock-# FROM tbl_stocks
stock-# ORDER BY vchr_name DESC
stock-# LIMIT 3;
 pk_int_stock_id | vchr_name | int_quantity | int_price | fk_int_supplier
-----------------+-----------+--------------+-----------+-----------------
               1 | Mouse     |           10 |     501.5 |               1
               3 | Modern    |           10 |    1201.5 |               2
               4 | Memory    |          100 |    1501.5 |               5
(3 rows)


stock=# SELECT vchr_name, int_quantity, int_price, (int_quantity * int_price) AS extended_price
stock-# FROM tbl_stocks;
 vchr_name | int_quantity | int_price | extended_price
-----------+--------------+-----------+----------------
 Mouse     |           10 |     501.5 |           5015
 Keyboard  |            5 |     451.5 |         2257.5
 Modern    |           10 |    1201.5 |          12015
 Memory    |          100 |    1501.5 |         150150
 Headphone |           50 |     751.5 |          37575
 Memory    |            2 |    3501.5 |           7003
(6 rows)



stock=# DELETE FROM tbl_stocks
stock-# WHERE fk_int_supplier = 5;
DELETE 1
stock=# select * from tbl_stocks;
 pk_int_stock_id | vchr_name | int_quantity | int_price | fk_int_supplier
-----------------+-----------+--------------+-----------+-----------------
               1 | Mouse     |           10 |     501.5 |               1
               2 | Keyboard  |            5 |     451.5 |               3
               3 | Modern    |           10 |    1201.5 |               2
               5 | Headphone |           50 |     751.5 |               4
               6 | Memory    |            2 |    3501.5 |               4
(5 rows)


stock=# INSERT INTO tbl_dep VALUES
stock-# (1,'computer science','CS'),
stock-# (2,'Electronics','EC'),
stock-# (3,'Commerce','CC'),
stock-# (4,'Arts','AR');
INSERT 0 4
stock=# select * from tbl_dep;
 pk_int_dept_id |  vchr_dept_name  | vchr_dept_description
----------------+------------------+-----------------------
              1 | computer science | CS
              2 | Electronics      | EC
              3 | Commerce         | CC
              4 | Arts             | AR
(4 rows)




