#Select all the actors with the first name ‘Scarlett’.
#How many films (movies) are available for rent and how many films have been rented?
#What are the shortest and longest movie duration? Name the values max_duration and min_duration.
#What's the average movie duration expressed in format (hours, minutes)?
#How many distinct (different) actors' last names are there?
#Since how many days has the company been operating (check DATEDIFF() function)?
#Show rental info with additional columns month and weekday. Get 20 results.
#Add an additional column day_type with values 'weekend' and 'workday' depending on the rental day of the week.
#How many rentals were in the last month of activity?
USE sakila;
SELECT * FROM sakila.actor
WHERE first_name = 'Scarlett';

SELECT count(distinct rental_id) from rental;
SELECT count(distinct inventory_id) from inventory;

SELECT min(length) from film;
SELECT max(length) from film;

SELECT (avg(length)/60) from film;
#select  convert(varchar(10), 1450 / 60) + ':' + convert(varchar(10), 1450 % 60)

SELECT count(distinct last_name) from actor;

SELECT datediff(max(last_update), min(rental_date)) FROM rental;

#Show rental info with additional columns month and weekday. Get 20 results.
select *, weekday(rental_date) as day,
month(rental_date) as month
from rental
limit 20;

#Add an additional column day_type with values 'weekend' and 'workday' depending on the rental day of the week.
SELECT *, weekday(rental_date) as day_of_rental, month(rental_date) as month_of_rental, 
case
when weekday(rental_date)<3 then "workday"
else "weekend"
end as Workday_weekend
from sakila.rental;


#How many rentals were in the last month of activity?
#SELECT max(rental_date) as last_month from sakila.rental;
#select count(rental_id) between max(rental_date) and '2006-01-14';
#SELECT DATE_FORMAT(rental_date, ‘%Y-%m-%d’) AS date, count(rental_id) AS count_rental FROM sakila.rental GROUP BY date;

select date(max(rental_date))- INTERVAL 30 DAY, date(max(rental_date)) #getting the days
from rental;
select count(rental_id) from sakila.rental
where date(rental_date) between date("2006-01-15") and date("2006-02-14");
