--What is the distribution of order values across all customers in the dataset?
select CustomerID , (Quantity*UnitPrice)  'Total customer spending'
from [Online-Retail] 


--How many unique products each customer purchases
select CustomerID, Description from [Online-Retail]
order by CustomerID desc

--Which customers have only made a single purchase from the company?
select CustomerID,Description,Quantity
from [Online-Retail]
where Quantity=1

--Which products are most commonly purchased together by customers in the dataset?
select o1.Description,o2.Description,
count(*) 'most commonly purchased products together by customers'
from [Online-Retail] o1 inner join [Online-Retail] o2 on 
o1.StockCode=o2.StockCode
and o1.Description<o2.Description
group by o1.Description,o2.Description
order by count(*) desc
