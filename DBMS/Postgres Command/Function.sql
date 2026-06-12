-- Scalar Functions

-- Upper function (convert text to uppercase)
select upper(title) as "Books Title" from books

-- Lower function (convert text to lowercase)
select lower(title) as "Books Title" from books

-- Concat function (combine multiple fields)
select concat(title,author) as "Books Title & Author Name" from books

-- Length function (get number of characters in a string)
select length(title) as "Books Title" from books

-- Aggregate Functions

-- Average (AVG) function
select avg(pages) from books

-- Maximum (MAX) function
select max(pages) from books

-- Minimum (MIN) function
select min(pages) from books

-- Sum (SUM) function
select sum(price) from books

-- Count function (count non-null values)
select count(price) from books

-- Count all rows (*)
select count(*) from books








