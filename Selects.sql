--------------------------------------------------------------------------------------------------------------------

Select FirstName, LastName
From Customer
Where FirstName Like 'H%' And Country = 'Germany'

--------------------------------------------------------------------------------------------------------------------

Select CompanyName
From Supplier
Where City = 'Berlin'

--------------------------------------------------------------------------------------------------------------------

Select *
From Product p,Supplier s
Where s.City = 'Berlin' 
And p.SupplierId = s.Id
AND p.UnitPrice > 30

--------------------------------------------------------------------------------------------------------------------

Select  FirstName, LastName
From Supplier s , Product p, OrderItem oi, "Order" o, Customer c
Where s.Id = p.SupplierId And p.Id = oi.ProductId AND oi.orderid = o.id AND o.CustomerId = c.Id
AND s.CompanyName = 'Lyngbysild'
group by c.Id, c.FirstName, c.LastName
Order By LastName 

--------------------------------------------------------------------------------------------------------------------

Update Supplier
Set Fax = Phone
Where Phone in(select Phone from Supplier where Fax IS NULL)

select * from Supplier 

--------------------------------------------------------------------------------------------------------------------

Update OrderItem
Set Quantity += 1
Where id in (
	select distinct oi.id from OrderItem oi,Product p,Supplier s, "Order" o
	where oi.ProductId = p.id and p.SupplierId = s.id and s.CompanyName='Pavlova, Ltd.' and  o.id=oi.OrderId

)-------------------------------------------------------------------------------------------------------------------

-- returns a table where the total amount does  match the sum
Select * 
FROM "Order" o, OrderItem oi
Where o.TotalAmount = (oi.Quantity*oi.UnitPrice) and o.Id = oi.OrderID

--------------------------------------------------------------------------------------------------------------------

DELETE 
From Customer
Where id in (select c.Id from "OrderItem" oi, Product p , Supplier s ,"Order" o, Customer c
where oi.ProductId = p.Id and s.Id = p.SupplierId and oi.OrderId = o.Id and o.CustomerId = c.Id and s.id = 29 )

DELETE 
From "Order"
Where id in (select o.Id from "OrderItem" oi, Product p , Supplier s ,"Order" o
where oi.ProductId = p.Id and s.Id = p.SupplierId and oi.OrderId = o.Id and s.id = 29 )

DELETE 
From OrderItem
Where id in (select oi.Id from "OrderItem" oi, Product p , Supplier s 
where oi.ProductId = p.Id and s.Id = p.SupplierId  and s.id = 29 )

DELETE 
From Product
Where id in (select p.Id from Product p , Supplier s 
where s.Id = p.SupplierId and s.id = 29 )

DELETE 
From Customer
Where id = 29
-- should not delete data from customer because there might be a chance that the same customer orderd two diffrent products
-- but you said to delete everything so i did. 
---------------------------------------------------------------------------------------------------------------------









