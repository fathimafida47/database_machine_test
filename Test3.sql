stock=#  CREATE TABLE stock
stock-# (item INTEGER NOT NULL,
stock(# dt DATE NOT NULL,
stock(# qty INTEGER NOT NULL,
stock(# PRIMARY KEY (item, dt));
CREATE TABLE
stock=# INSERT INTO stock (item, dt, qty)
stock-# VALUES
stock-# (1001,'2019-11-11',340)
stock-# ,(1002,'2019-11-23',120)
stock-# ,(1002,'2019-12-20',201)
stock-# ,(1002,'2019-12-16',402)
stock-# ,(1001,'2020-01-19',890)
stock-# ,(1001,'2020-02-12',340)
stock-# ,(1001,'2020-02-27',101)
stock-# ,(1001,'2020-02-29',391)
stock-# ,(1002,'2020-03-11',172)
stock-# ,(1002,'2020-04-21',150);
INSERT 0 10
stock=# CREATE VIEW stockmonthly AS
stock-# SELECT
stock-#     item,
stock-#     EXTRACT(YEAR FROM dt) AS year,
stock-#     EXTRACT(MONTH FROM dt) AS month,
stock-#     SUM(qty) AS monthly_total,
stock-#     ROW_NUMBER() OVER (PARTITION BY item, EXTRACT(YEAR FROM dt), EXTRACT(MONTH FROM dt) ORDER BY SUM(qty) DESC) AS rnk
stock-# FROM
stock-#     stock
stock-# GROUP BY
stock-#     item,
stock-#     EXTRACT(YEAR FROM dt),
stock-#     EXTRACT(MONTH FROM dt);
CREATE VIEW
stock=# select * from stockmonthly;
 item | year | month | monthly_total | rnk
------+------+-------+---------------+-----
 1001 | 2019 |    11 |           340 |   1
 1001 | 2020 |     1 |           890 |   1
 1001 | 2020 |     2 |           832 |   1
 1002 | 2019 |    11 |           120 |   1
 1002 | 2019 |    12 |           603 |   1
 1002 | 2020 |     3 |           172 |   1
 1002 | 2020 |     4 |           150 |   1
(7 rows)


stock=# SELECT dt, qty
stock-# FROM stock
stock-# ORDER BY qty DESC
stock-# LIMIT 1 OFFSET 1;
     dt     | qty
------------+-----
 2019-12-16 | 402
(1 row)

stock=# CREATE TABLE journey (
stock(#     descr VARCHAR(100) PRIMARY KEY,
stock(#     distance VARCHAR(7) NOT NULL
stock(#     );
CREATE TABLE
stock=# INSERT INTO journey (descr, distance)
stock-# VALUES
stock-# ('London-Paris','342km'),
stock-# ('New York-Los Angeles','2445mi'),
stock-# ('New York-Washington','203mi'),
stock-# ('Paris-Rome',' 1106km');
INSERT 0 4



stock=# CREATE TABLE programmer (employee_name VARCHAR(20) NOT NULL PRIMARY KEY, location
stock(# VARCHAR(20) NOT NULL);
CREATE TABLE
stock=# CREATE TABLE skill (employee_name VARCHAR(20) NOT NULL, language VARCHAR(20) NOT
stock(# NULL, rating INT NOT NULL, PRIMARY KEY (employee_name, language));
CREATE TABLE
stock=# INSERT INTO programmer (employee_name, location)
stock-# VALUES
stock-# ('Alan','London')
stock-# ,('Belinda','New York')
stock-# ,('Chuck','New York')
stock-# ,('Diana','London')
stock-# ,('Ed','New York')
stock-# ,('Frank','London')
stock-# ,('Gail','Dublin');
INSERT 0 7
stock=# INSERT INTO skill (employee_name, language, rating)
stock-# VALUES
stock-# ('Alan','C++',9)
stock-# ,('Alan','Java',6)
stock-# ,('Belinda','Java',10)
stock-# ,('Belinda','Python',8)
stock-# ,('Chuck','C++',7)
stock-# ,('Diana','Python',10)
stock-# ,('Diana','Java',5)
stock-# ,('Ed','Java',8)
stock-# ,('Frank','C++',9)
stock-# ,('Frank','Python',6)
stock-# ,('Gail','Java',6);
INSERT 0 11
stock=# SELECT location, COUNT(*) as count_of_people
stock-# FROM programmer
stock-# INNER JOIN skill ON programmer.employee_name = skill.employee_name
stock-# WHERE skill.language = 'C++' AND skill.rating >= 7
stock-# GROUP BY location;
 location | count_of_people
----------+-----------------
 London   |               2
 New York |               1










