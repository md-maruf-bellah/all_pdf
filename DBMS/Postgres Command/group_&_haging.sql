select * from books

-- Find books where ISBN is NULL
select * from books where isbn is null
  
select * from books where isbn is not null  

-- COALESCE 
select title , coalesce(isbn,0) as isbn,coalesce(price,0) as price from books

-- Limit 
select * from books limit 5

-- Offset
select * from books offset 5

-- Pagination  
select * from books limit 5 offset 5 * 0 
select * from books limit 5 offset 5 * 1 

-- Group by 
select category from books group by category

select category, sum(price * stock) as total from books group by category 

-- Having 
select category, sum(price * stock) as total from books group by category having sum(price * stock) is not null

select category, sum(price * stock) as total from books group by category having sum(price * stock) > 10000

-- Update 
update books
set category='Web', isbn=1019,price=500
where id=19
  
-- 17 -> category -> M ; 18 -> Category -> Y
update books  
set category = case 
 when id= 17 then 'M'
 when id = 18 then 'Database'
end
where id in (17,18)

-- Delete
delete from books where id = 15









