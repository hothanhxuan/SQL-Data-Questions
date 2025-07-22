SELECT * FROM pizza_toppings AS tb1
INNER JOIN pizza_toppings AS tb2
ON tb1.topping_name < tb2.topping_name
INNER JOIN pizza_toppings AS tb3
ON tb2.topping_name < tb3.topping_name;
