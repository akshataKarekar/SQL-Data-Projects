--which actors have the first name 'scarlett'

select * from actor where first_name = 'scarlett';

-- how many distinct actors last name are there

select last_name, count(last_name) from actor group by last_name

-- which last names are not repeated

select distinct last_name from actor group by last_name having count(last_name) =1

-- which actor has appeared in most films

select first_name,last_name,count(*) as total from film_actor,actor where film_actor.actor_id =actor.actor_id group by first_name,last_name order by total desc limit 1


 --List last names of actors and the number of actors who have that last name, but only for names that are shared by at least two actors

select last_name, count(*) as Total from actor group by last_name having count(*) > 1;


-- display the first name and last name of all actors in a single column in upper case letters. name the column actor name.


SELECT CONCAT(first_name,'-',last_name) AS "Actor Names" FROM actor


--Use subqueries to display all actors who appear in the film Alone Trip.


SELECT first_name, last_name from actor,film_actor, film where actor.actor_id=film_actor.actor_id and film_actor.film_id = film.film_id and film.title like '%Alone Trip';


--In your new role as an executive, you would like to have an easy way of viewing the Top five genres by gross revenue. 
-- Use the solution from the problem above to create a view. If you haven't solved 7h, you can substitute another query to 
-- create a view.

drop view if exists top_five_genres;
create view Top_5_Genres as
select cat.name, sum(p.amount) as revenue from category cat
inner join film_category fcat on cat.category_id = fcat.category_id
inner join inventory inv on fcat.film_id = inv.film_id
inner join rental rt on inv.inventory_id = rt.inventory_id
group by cat.name
order by revenue desc
limit 5;









