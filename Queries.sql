select * from album
select * from artist
select * from customer
select  * from employee


1) who is senior employee?

select first_name,last_name,title,levels from employee order by levels desc limit 1



2)which country have most invoices?

select * from invoice
select billing_country,count(billing_country) as counts from invoice group by billing_country order by counts desc limit 1



3) top three values of total invoices

select billing_country,count(billing_country) as counts from invoice group by billing_country order by counts desc limit 3



4)city having highest total

select * from invoice

select billing_city,sum(total) as Total_Amount from invoice group by billing_city order by Total_amount desc limit 1



5)best customer who spent most money

select * from customer

select customer_id,sum(total) as spent from invoice group by customer_id order by spent desc limit 1


select c.first_name,c.last_name,sum(i.total) as amt from customer as c join invoice as i on c.customer_id=i.customer_id 
group by c.first_name,c.last_name order by amt desc limit 1



6) Write query to return the email, first name, last name, & Genre of all Rock Music listeners. 
Return your list ordered alphabetically by email starting with A.


select distinct email,first_name,last_name from customer as cust join invoice as inv on cust.customer_id = inv.customer_id
join invoice_line as invl on inv.invoice_id = invl.invoice_id where track_id IN
(
select tra.track_id from genre as gen join track as tra on gen.genre_id = tra.genre_id where gen.name = 'Rock'
)
order by email	



7) Lets invite the artists who have written the most rock music in our dataset. 
Write a query that returns the Artist name and total track count of the top 10 rock bands.


select artist.artist_id,artist.name,count(track.track_id) as counts   from artist 
join album on artist.artist_id = album.artist_id
join track on album.album_id = track.album_id
join genre on track.genre_id = genre.genre_id
where genre.name = 'Rock'
group by artist.artist_id order by counts desc



8) Return all the track names that have a song length longer than the average song length. 
Return the Name and Milliseconds for each track. Order by the song length with the longest songs listed first.

select track_id,name,milliseconds from track where milliseconds >
(select avg(milliseconds) from track) order by milliseconds desc








































































