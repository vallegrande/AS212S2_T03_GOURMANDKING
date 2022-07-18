/* Listar los nombres y apellidos de los empleados (staf) con el país de cada tienda en la que trabajan */
select
	customer.first_name,
    customer.last_name,
    address.address,
    address.district,
    city.city,
    country.country
from customer
	INNER JOIN address
    on customer.address_id = address.address_id
    INNER JOIN City
    on address.City_id = city.city_id
    INNER join Country
    on city.country_id = country.country_id;

/*Cuantas peliculas hay por categoria*/

select
    category.name,
    count(category.name)
from
	film
    inner join film_category
    on film.film_id = film_category.film_id
    inner join category
    on film_category.category_id = category.category_id
group by
category.name;

/*Cuantos clientes hay por cada pais*/

select
    country.country,
    count(customer.country)
from
	customer
    inner join customer_list
    on customer.customer_id = customer_list.customer_id
    inner join city
    on city_id.country_id = country.country_id
group by
country.country;

