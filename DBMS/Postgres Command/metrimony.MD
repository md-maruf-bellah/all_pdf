---
# Level 1: Database

ধরো তুমি Shaadi.com-এর মতো একটি Matrimony Website বানাচ্ছো।

```sql
CREATE DATABASE matrimony_db;
```

এতে একটা নতুন Database তৈরি হবে।

Database = আলমারি

Table = আলমারির ড্রয়ার

Row = ড্রয়ারের একটি ফাইল

Column = ফাইলের তথ্য

```
matrimony_db
│
├── profiles
├── users
├── interests
└── subscriptions
```
---

# Level 2: Table

এখন Profile Table বানাই।

```sql
CREATE TABLE profiles(
    id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    age INT,
    religion VARCHAR(50),
    profession VARCHAR(100),
    salary INT
);
```

ডেটা দেখতে এমন হবে:

| id  | name   | age | religion  | profession | salary |
| --- | ------ | --- | --------- | ---------- | ------ |
| 1   | Fatima | 25  | Islam     | Teacher    | 30000  |
| 2   | Rahim  | 28  | Islam     | Engineer   | 60000  |
| 3   | John   | 30  | Christian | Doctor     | 80000  |

---

# Level 3: INSERT

একজন User যোগ করা।

```sql
INSERT INTO profiles
(name,age,religion,profession,salary)
VALUES
('Fatima',25,'Islam','Teacher',30000);
```

একাধিক User:

```sql
INSERT INTO profiles
(name,age,religion,profession,salary)
VALUES
('Rahim',28,'Islam','Engineer',60000),
('John',30,'Christian','Doctor',80000),
('Priya',24,'Hindu','Designer',40000);
```

---

# Level 4: SELECT

সব Profile দেখো।

```sql
SELECT * FROM profiles;
```

ফলাফল

| id  | name   | age |
| --- | ------ | --- |
| 1   | Fatima | 25  |
| 2   | Rahim  | 28  |

---

শুধু নাম দেখো

```sql
SELECT name FROM profiles;
```

---

নাম ও বয়স দেখো

```sql
SELECT name,age
FROM profiles;
```

---

# Level 5: WHERE

২৫ বছরের বেশি বয়স

```sql
SELECT *
FROM profiles
WHERE age > 25;
```

ফলাফল

| name  | age |
| ----- | --- |
| Rahim | 28  |
| John  | 30  |

---

শুধু মুসলিম

```sql
SELECT *
FROM profiles
WHERE religion='Islam';
```

---

# Level 6: AND OR NOT

মুসলিম এবং বয়স ২৫+

```sql
SELECT *
FROM profiles
WHERE religion='Islam'
AND age > 25;
```

---

মুসলিম অথবা হিন্দু

```sql
SELECT *
FROM profiles
WHERE religion='Islam'
OR religion='Hindu';
```

---

মুসলিম ছাড়া

```sql
SELECT *
FROM profiles
WHERE NOT religion='Islam';
```

---

# Level 7: IN

এটা OR-এর Short Version।

```sql
SELECT *
FROM profiles
WHERE religion IN
('Islam','Hindu');
```

একই ফলাফল

```sql
religion='Islam'
OR religion='Hindu'
```

---

# Level 8: BETWEEN

বয়স ২৫ থেকে ৩০

```sql
SELECT *
FROM profiles
WHERE age BETWEEN 25 AND 30;
```

এটা আসলে

```sql
age >= 25
AND age <= 30
```

---

# Level 9: LIKE

নামের শুরু F

```sql
SELECT *
FROM profiles
WHERE name LIKE 'F%';
```

ফলাফল

```
Fatima
Farhan
Fahim
```

---

নামের শেষে a

```sql
SELECT *
FROM profiles
WHERE name LIKE '%a';
```

```
Fatima
Priya
```

---

# Level 10: ORDER BY

বয়স ছোট থেকে বড়

```sql
SELECT *
FROM profiles
ORDER BY age ASC;
```

---

বেতন বেশি থেকে কম

```sql
SELECT *
FROM profiles
ORDER BY salary DESC;
```

---

# Level 11: Aggregate Functions

মোট Profile

```sql
SELECT COUNT(*)
FROM profiles;
```

---

গড় বয়স

```sql
SELECT AVG(age)
FROM profiles;
```

---

সর্বোচ্চ বেতন

```sql
SELECT MAX(salary)
FROM profiles;
```

---

সর্বনিম্ন বেতন

```sql
SELECT MIN(salary)
FROM profiles;
```

---

# Level 12: GROUP BY

Religion অনুযায়ী User Count

```sql
SELECT religion,
COUNT(*)
FROM profiles
GROUP BY religion;
```

ফলাফল

| religion  | count |
| --------- | ----- |
| Islam     | 20    |
| Hindu     | 10    |
| Christian | 5     |

---

# Level 13: HAVING

যেসব Religion-এ ১০ জনের বেশি User আছে।

```sql
SELECT religion,
COUNT(*)
FROM profiles
GROUP BY religion
HAVING COUNT(*) > 10;
```

---

# Level 14: JOIN

এখন Users এবং Subscription Table।

### users

| id  | name   |
| --- | ------ |
| 1   | Fatima |
| 2   | Rahim  |

### subscriptions

| id  | plan   | user_id |
| --- | ------ | ------- |
| 1   | Gold   | 1       |
| 2   | Silver | 2       |

---

```sql
SELECT users.name,
subscriptions.plan
FROM users
INNER JOIN subscriptions
ON users.id=subscriptions.user_id;
```

ফলাফল

| name   | plan   |
| ------ | ------ |
| Fatima | Gold   |
| Rahim  | Silver |

---

# Level 15: Subquery

সবচেয়ে বেশি Salary কার?

```sql
SELECT *
FROM profiles
WHERE salary=
(
SELECT MAX(salary)
FROM profiles
);
```

---

# Level 16: CASE

Salary অনুযায়ী Category।

```sql
SELECT name,
CASE
WHEN salary > 70000 THEN 'High'
WHEN salary > 40000 THEN 'Medium'
ELSE 'Low'
END AS income_level
FROM profiles;
```

---

# Level 17: Window Function

Salary Ranking

```sql
SELECT
name,
salary,
RANK() OVER(
ORDER BY salary DESC
)
FROM profiles;
```

ফলাফল

| name   | salary | rank |
| ------ | ------ | ---- |
| John   | 80000  | 1    |
| Rahim  | 60000  | 2    |
| Fatima | 30000  | 3    |

---

# Level 18: Index

ধরো ৫০ লাখ Profile আছে।

```sql
CREATE INDEX idx_religion
ON profiles(religion);
```

এখন

```sql
WHERE religion='Islam'
```

অনেক দ্রুত হবে।

---

# Level 19: Transaction

Premium Purchase

```sql
BEGIN;

UPDATE users
SET balance = balance - 500;

UPDATE subscriptions
SET plan='Gold';

COMMIT;
```

যদি সমস্যা হয়

```sql
ROLLBACK;
```

সব আগের অবস্থায় ফিরে যাবে।

---

# SQL Master হওয়ার জন্য সবচেয়ে গুরুত্বপূর্ণ ১০টি Topic

1. SELECT
2. WHERE
3. JOIN
4. GROUP BY
5. HAVING
6. Subquery
7. CTE
8. Window Functions
9. Indexing
10. Transactions

যদি তুমি চাও, আমি পরের ধাপে **JOIN (INNER, LEFT, RIGHT, FULL OUTER, SELF JOIN)** একদম চিত্র (diagram) এবং Matrimony Website-এর বাস্তব উদাহরণ দিয়ে গভীরভাবে শেখাতে পারি। এটা SQL-এর সবচেয়ে গুরুত্বপূর্ণ টপিকগুলোর একটি।
