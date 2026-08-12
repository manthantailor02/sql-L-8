find the highest value order for every customer
select * from
             (select customer_name, order_id,max(amount) over(partition by customer_id ) as customer_max from orders) as t
where amount=customer_max;

find two highest value orders for every customer.
select * from
             (select customer_name, order_id, rank(amount) over(partition by customer_id order by amount desc) as rank1 from orders) as t2
where rank1<=2;

calculate the percentage contribution of each order to the customer's total spending.
select customer, order_id, amount,sum(amount) over(partition by by customer_id) as total_spend,
(amount/sum(amount) over(partition by by customer_id))*100 as contribution
from orders;