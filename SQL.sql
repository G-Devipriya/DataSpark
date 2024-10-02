select count(c.customerkey) as CountofCustomers, p.category as ProductCategory from dataspark.sales s, dataspark.Customers c, dataspark.products p where c.customerkey=s.customerkey and p.productkey=s.productkey group by p.category;


select count(customerkey), gender from dataspark.Customers c where c.customerkey group by gender;


select distinct p.category as ProductCategory,sum(s.quantity*p.unit_price_Usd) as Sales  from dataspark.sales s inner join dataspark.Customers c on c.customerkey=s.customerkey inner join dataspark.products p on p.productkey=s.productkey group by p.category;


select distinct s.order_date as OrderDate,count(s.order_number) as OrderCount,sum(s.quantity*p.unit_price_Usd) as Sales, sum(s.quantity*p.unit_cost_Usd) as Cost, sum(s.quantity*p.unit_price_Usd) - sum(s.quantity*p.unit_cost_Usd) as Profit   from dataspark.sales s inner join dataspark.Customers c on c.customerkey=s.customerkey inner join dataspark.products p on p.productkey=s.productkey group by s.order_date;


select distinct st.country as country,sum(s.quantity*p.unit_price_Usd) as Sales  from dataspark.sales s inner join dataspark.stores st on s.storekey=st.storekey inner join dataspark.products p on p.productkey=s.productkey group by st.country;


select distinct p.brand as Brand, sum(s.quantity*p.unit_price_Usd) - sum(s.quantity*p.unit_cost_Usd) as Profit  from dataspark.sales s inner join dataspark.products p on p.productkey=s.productkey group by p.brand;


select distinct p.category as category, sum(s.quantity*p.unit_price_Usd) - sum(s.quantity*p.unit_cost_Usd) as Profit  from dataspark.sales s inner join dataspark.products p on p.productkey=s.productkey group by p.category;


select distinct p.category as category, sum(p.unit_price_Usd) as Price, sum(p.unit_cost_Usd) as Cost  from dataspark.sales s inner join dataspark.products p on p.productkey=s.productkey group by p.category;


select country,count(storekey) from dataspark.stores group by country;


select distinct st.country,sum((s.quantity*p.unit_price_Usd)/st.square_meters) as SalesBySquarefoot from dataspark.sales s inner join dataspark.stores st on s.storekey=st.storekey inner join dataspark.products p on p.productkey=s.productkey group by st.country;


SELECT st.country, SUM(s.quantity * p.unit_price_Usd) - SUM(s.quantity * p.unit_cost_Usd) AS Profit FROM dataspark.sales s INNER JOIN dataspark.stores st ON s.storekey = st.storekey INNER JOIN dataspark.products p ON p.productkey = s.productkey GROUP BY st.country;


SELECT Subcategory, AVG(CAST(REPLACE(`Unit_Cost_USD`, '$', '') AS DECIMAL(10, 2))) AS Avg_Unit_Cost FROM Products GROUP BY Subcategory ORDER BY Avg_Unit_Cost DESC;