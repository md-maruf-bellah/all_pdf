-- Create users table with primary key
create table users(
  id serial primary key,
  username varchar(255) not null
)

-- Create orders table with foreign key referencing users(id)
create table orders(
  id serial primary key,
  product varchar(255) not null,
  user_id int references users(id) on delete cascade
)

-- Insert sample data into users & orders table
insert into users(username) values
('Alice'),('Robert'),('Sorker'),('Epick'),('Emma')


insert into orders(product,user_id) values
('Laptop',1),('Mouse',1),('Keyboard',3),('Phone',4),('Calculator',2)

select * from users
select * from orders

-- INNER JOIN = Join
select * from users
inner join orders on orders.user_id = users.id

select username,count(orders.id) from users
inner join orders on orders.user_id = users.id group by username

-- LEFT JOIN
select * from users
left join orders on orders.user_id = users.id


-- RIGHT JOIN
select * from orders
right join users on orders.user_id = users.id
 
-- CROSS JOIN  
select * from users
cross join orders

-- NATURAL JOIN
select * from users
natural join orders









