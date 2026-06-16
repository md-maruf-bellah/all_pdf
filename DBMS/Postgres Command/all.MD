# Complete SQL Practice Roadmap

## Level 1 : Database

```sql
CREATE DATABASE library;
DROP DATABASE library;
```

---

# Level 2 : Table

```sql
CREATE TABLE books(...);

DROP TABLE books;

ALTER TABLE books
ADD COLUMN stock INT;

ALTER TABLE books
DROP COLUMN stock;

ALTER TABLE books
RENAME COLUMN title TO book_title;

ALTER TABLE books
RENAME TO library_books;
```

---

# Level 3 : Constraints

```sql
PRIMARY KEY

FOREIGN KEY

UNIQUE

NOT NULL

CHECK

DEFAULT
```

Practice:

```sql
ALTER TABLE books
ADD CONSTRAINT title_unique UNIQUE(title);

ALTER TABLE books
DROP CONSTRAINT title_unique;
```

---

# Level 4 : Insert

```sql
INSERT INTO books(...)

INSERT INTO books VALUES(...)

INSERT INTO books
SELECT ...
```

Practice:

- Single row
- Multiple rows
- Default value
- NULL value

---

# Level 5 : Select

```sql
SELECT *

SELECT title

SELECT title,price

SELECT DISTINCT category
```

---

# Level 6 : Where

```sql
WHERE

=

>

<

>=

<=

!=

<>
```

Practice:

```sql
price>500

price<100

category='Web'
```

---

# Level 7 : AND OR NOT

```sql
WHERE price>500
AND stock>10

WHERE category='Web'
OR category='Programming'

WHERE NOT category='Math'
```

---

# Level 8 : IN

```sql
WHERE category IN (...)

WHERE category NOT IN (...)
```

---

# Level 9 : BETWEEN

```sql
WHERE price BETWEEN 100 AND 500

WHERE date BETWEEN ...
```

---

# Level 10 : LIKE

```sql
LIKE

ILIKE

%

_
```

Practice:

```
A%

%A

%A%

A___

____A
```

---

# Level 11 : NULL

```sql
IS NULL

IS NOT NULL

COALESCE()
```

---

# Level 12 : ORDER BY

```sql
ORDER BY price

ORDER BY price DESC

ORDER BY title ASC

ORDER BY price DESC,title ASC
```

---

# Level 13 : LIMIT OFFSET

```sql
LIMIT

OFFSET
```

Pagination:

```sql
LIMIT 10 OFFSET 0

LIMIT 10 OFFSET 10

LIMIT 10 OFFSET 20
```

---

# Level 14 : Aggregate

```sql
COUNT()

SUM()

AVG()

MIN()

MAX()
```

---

# Level 15 : GROUP BY

```sql
GROUP BY category

GROUP BY author
```

---

# Level 16 : HAVING

```sql
GROUP BY category
HAVING COUNT(*)>5

HAVING SUM(price)>10000
```

---

# Level 17 : CASE

```sql
CASE

WHEN

THEN

ELSE

END
```

---

# Level 18 : String Functions

```sql
UPPER()

LOWER()

CONCAT()

LENGTH()

TRIM()

SUBSTRING()

REPLACE()
```

---

# Level 19 : Date Functions

```sql
NOW()

CURRENT_DATE

CURRENT_TIME

AGE()

EXTRACT()

DATE_TRUNC()
```

---

# Level 20 : Math Functions

```sql
ROUND()

CEIL()

FLOOR()

ABS()

MOD()
```

---

# Level 21 : UPDATE

```sql
UPDATE books

SET price=500

WHERE id=1
```

CASE UPDATE:

```sql
UPDATE books
SET category=
CASE
WHEN id=1 THEN 'Web'
WHEN id=2 THEN 'Database'
END;
```

---

# Level 22 : DELETE

```sql
DELETE FROM books

DELETE WHERE id=1
```

---

# Level 23 : JOIN

Practice:

```
INNER JOIN

LEFT JOIN

RIGHT JOIN

FULL OUTER JOIN

CROSS JOIN

SELF JOIN
```

---

# Level 24 : UNION

```sql
UNION

UNION ALL
```

---

# Level 25 : Subquery

Practice:

```
MAX()

MIN()

AVG()

EXISTS

NOT EXISTS

IN

ANY

ALL
```

Example:

```sql
SELECT *
FROM books
WHERE price=(
SELECT MAX(price)
FROM books
);
```

---

# Level 26 : CTE

```sql
WITH temp AS
(
SELECT *
FROM books
)
SELECT *
FROM temp;
```

Recursive:

```sql
WITH RECURSIVE
```

---

# Level 27 : Window Functions

Practice:

```
ROW_NUMBER()

RANK()

DENSE_RANK()

NTILE()

LAG()

LEAD()

FIRST_VALUE()

LAST_VALUE()
```

---

# Level 28 : Views

```sql
CREATE VIEW

ALTER VIEW

DROP VIEW
```

---

# Level 29 : Index

Practice:

```sql
CREATE INDEX

DROP INDEX

UNIQUE INDEX

COMPOSITE INDEX
```

---

# Level 30 : Transactions

```sql
BEGIN;

COMMIT;

ROLLBACK;

SAVEPOINT;
```

---

# Level 31 : Functions

```sql
CREATE FUNCTION

RETURNS

LANGUAGE SQL

LANGUAGE plpgsql
```

---

# Level 32 : Procedures

```sql
CREATE PROCEDURE

CALL
```

---

# Level 33 : Triggers

Practice:

```
BEFORE INSERT

AFTER INSERT

BEFORE UPDATE

AFTER UPDATE

BEFORE DELETE

AFTER DELETE
```

---

# Level 34 : JSONB

Practice:

```sql
->

->>

@>

jsonb_set()
```

---

# Level 35 : Arrays

Practice:

```sql
ARRAY[]

UNNEST()

ANY()

ARRAY_APPEND()

ARRAY_REMOVE()
```

---

# Level 36 : Performance

Practice:

```
EXPLAIN

EXPLAIN ANALYZE
```

---

# Final Challenge Projects

1. Library Management System
2. Student Management System
3. Hospital Management System
4. E-commerce Database
5. Matrimony Website Database
6. Hotel Booking System
7. Food Delivery System
8. Banking System
9. Inventory Management System
10. Social Media Database
