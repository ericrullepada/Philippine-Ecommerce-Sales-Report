SELECT * FROM phil_sales.sales_record;

/* This Project is to cross validated the result of the Philippines Ecomerce Sales Report*/ 

/*Calculate the YTD SALES 2025*/

SELECT YEAR(CURDATE()) `Year`,SUM(sales_per_order) AS YTD_Sales
FROM sales_record
WHERE YEAR(order_date) = YEAR(CURDATE());


/*Calculate the YTD PROFIT 2025*/
select year(curdate()), sum(profit_per_order) YTD_Profit
from sales_record
Where year(order_date)= year(curdate());



/*Calculate the YTD Qauntity 2025*/

select year(curdate()) `Year`, sum(Order_quantity) YTD_Quantity
from sales_record
Where year(order_date)= year(curdate());

/*Calculate the YTD Profit Margin */
select year(curdate()) `Year` ,
			sum(Profit_per_order)/sum(sales_per_order) *100 Profit_Margin
from sales_record
Where year(order_date)= year(curdate());

/*Sales by Category*/

SELECT Category_name,
    YEAR(order_date) AS `Year`,
    SUM(sales_per_order) AS Sales_by_year
FROM sales_record
WHERE YEAR(order_date) IN (YEAR(CURDATE()), YEAR(CURDATE())-1)
GROUP BY Category_name,YEAR(order_date)
ORDER BY `Year` DESC;

/*Top 5 Products by YTD Sales*/ 

Select Product_name, sum(sales_per_order) sales
from sales_record
where year(Order_date)=year(curdate())
group by Product_name
order by sales desc
limit 5;

/*Bottom 5 Products by YTD Sales*/ 
Select Product_name, sum(sales_per_order) sales
from sales_record
where year(Order_date)=year(curdate())
group by Product_name
order by sales
limit 5;

/* Sales By Shipping Type */ 
select shipping_type,sum(sales_per_order) sales
from sales_record
where year(Order_date)=year(curdate())
group by Shipping_type
order by Shipping_type ;

/*Total Deliveries by Type*/

Select shipping_type , count(shipping_type) shipping_type
from sales_record
where year(Order_date)=year(curdate())
group by Shipping_type;

/*Total Sales by City*/

Select Customer_city, sum(sales_per_order) sales
from sales_record
where year(Order_date)=year(curdate())
group by Customer_city
order by sales Desc;











