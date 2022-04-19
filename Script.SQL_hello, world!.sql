--skenario_1

select
	gender,
	email,
	count(gender)  
from datasource_sql_ds14.customer as c  
where 
	gender = 'Female' and 
	email = 'Gmail' 
group by 1, 2


select
	c.id "Akun",  	
	c.city "Kota", 	
	c.email "Email", 	
	c.gender "Jenis Kelamin", 	
	sum(t.quantity) "Jumlah Transaksi",
	count(c.gender)  
from datasource_sql_ds14.customer as c 
left join datasource_sql_ds14.transaction as t on c.id = t.customer_id  
where 
	city = 'Jakarta' and 
	gender = 'Female' and 
	email = 'Gmail' 
group by 1, 2, 3, 4 
having sum(quantity) >= 10 
order by 5 desc  
limit 10


--skenario_2

select 
	product_id, 
	quantity, 
	created_at 
from datasource_sql_ds14.transaction as t 
where created_at >= '2018-10-01' and created_at <= '2018-12-31' 
group by 1, 2, 3
having t.quantity >= avg(t.quantity)
order by 2 desc 
limit 5


--skenario_3

select
	c.gender "Jenis Kelamin",
	c.city "Kota",
	s.type "Tipe Toko",
	sum(t.total) "Jumlah Total",
	sum(t.quantity) "Jumlah Quantity" 
from datasource_sql_ds14.customer as c  
left join datasource_sql_ds14."transaction" as t on c.id = t.customer_id  
left  join datasource_sql_ds14.store as s on s.id = t.store_id  
where city = 'Jakarta' 
group by 1, 2, 3 
order by 1 


select  	
	c.gender "Jenis Kelamin", 	
	c.city "Kota", 	
	s.type "Tipe Toko", 	
	sum(t.total) "Jumlah Total", 	
	sum(t.quantity) "Jumlah Quantity" 
from datasource_sql_ds14.customer as c 
left join datasource_sql_ds14.transaction as t on c.id = t.customer_id 
left  join datasource_sql_ds14.store as s on s.id = t.store_id 
where city <> 'Jakarta'
group by 1,2,3
order by 1, 2 desc, 4 desc

