use CASE_STUDY
select * from [dbo].[Continent]
select * from [dbo].[Customers]
select * from [dbo].[Transaction]

--1. Display the count of customers in each region who have done the
--transaction in the year 2020.
SELECT c.region_id, COUNT(*) AS customer_count
FROM Customers c
INNER JOIN [dbo].[Transaction] t ON c.customer_id = t.customer_id
WHERE YEAR(t.txn_date) = 2020
GROUP BY c.region_id;

--2. Display the maximum and minimum transaction amount of each
--transaction type.
SELECT txn_type, MAX(txn_amount) AS max_amount, MIN(txn_amount) AS min_amount
FROM [dbo].[Transaction]
GROUP BY txn_type;

--3. Display the customer id, region name and transaction amount where
--transaction type is deposit and transaction amount > 2000.
SELECT c.customer_id, con.region_name, t.txn_amount
FROM Customers c
INNER JOIN[dbo].[Transaction] t ON c.customer_id = t.customer_id
INNER JOIN Continent con ON c.region_id = con.region_id
WHERE t.txn_type = 'deposit' AND t.txn_amount > 2000;

--4. Find duplicate records in the Customer table.
SELECT customer_id, COUNT(*) AS duplicate_count
FROM Customers
GROUP BY customer_id
HAVING COUNT(*) > 1;

--5. Display the customer id, region name, transaction type and transaction
--amount for the minimum transaction amount in deposit.
SELECT c.customer_id, con.region_name, t.txn_type, t.txn_amount
FROM Customers c
INNER JOIN [dbo].[Transaction] t ON c.customer_id = t.customer_id
INNER JOIN Continent con ON c.region_id = con.region_id
WHERE t.txn_type = 'deposit'
AND t.txn_amount = (SELECT MIN(txn_amount) FROM [dbo].[Transaction] WHERE txn_type = 'deposit');

--6. Create a stored procedure to display details of customers in the
--Transaction table where the transaction date is greater than Jun 2020.
go
CREATE PROCEDURE GetCustomersByTransactionDate

AS
BEGIN
    SELECT c.customer_id, con.region_name, t.txn_date
    FROM Customers c
    INNER JOIN [dbo].[Transaction] t ON c.customer_id = t.customer_id
    INNER JOIN Continent con ON c.region_id = con.region_id
    WHERE t.txn_date > '2020-06-01';
END;

--7. Create a stored procedure to insert a record in the Continent table.
go
CREATE PROCEDURE InsertContinent

    @region_id INT,
    @region_name VARCHAR(50)
AS
BEGIN
    INSERT INTO Continent (region_id, region_name)
    VALUES (@region_id, @region_name);
END;

--8. Create a stored procedure to display the details of transactions that
--happened on a specific day.
go
CREATE PROCEDURE GetTransactionsByDate
    @txn_date DATE
AS
BEGIN
    SELECT *
    FROM [dbo].[Transaction]
    WHERE txn_date = @txn_date;
END;

--9. Create a user defined function to add 10% of the transaction amount in a
--table
go
CREATE FUNCTION AddPercentageToAmount(@amount DECIMAL(18, 2))
RETURNS DECIMAL(18, 2)
AS
BEGIN
    RETURN @amount + (@amount * 0.10);
END;

--10. Create a user defined function to find the total transaction amount for a
--given transaction type.
go
CREATE FUNCTION GetTotalAmountByType(@txn_type VARCHAR(50))
RETURNS DECIMAL(18, 2)
AS
BEGIN
    DECLARE @total_amount DECIMAL(18, 2);
    SELECT @total_amount = SUM(txn_amount)
    FROM [dbo].[Transaction]
    WHERE txn_type = @txn_type;
    RETURN @total_amount;
END;

--11. Create a table value function which comprises the columns customer_id,
--region_id ,txn_date , txn_type , txn_amount which will retrieve data from
--the above table.
go
CREATE FUNCTION GetTransactions()
RETURNS TABLE
AS
RETURN (
    SELECT customer_id, region_id, txn_date, txn_type, txn_amount
    FROM [dbo].[Transaction]
);
 select * from [dbo].[Transaction]
--12. Create a TRY...CATCH block to print a region id and region name in a
--single column.
BEGIN TRY
    SELECT CONCAT(region_id, ' - ', region_name) AS region_info
    FROM Continent;
END TRY
BEGIN CATCH
    PRINT 'An error occurred.';
END CATCH;

--13. Create a TRY...CATCH block to insert a value in the Continent table.
BEGIN TRY
    INSERT INTO Continent (region_id, region_name)
    VALUES (10, 'Test Region');
END TRY
BEGIN CATCH
    PRINT 'An error occurred: ' + ERROR_MESSAGE();
END CATCH;

--14. Create a trigger to prevent deleting a table in a database.
go
CREATE TRIGGER PreventTableDeletion
ON DATABASE
FOR DROP_TABLE
AS
BEGIN
    PRINT 'Table deletion is not allowed.';
    ROLLBACK;
END;

--15. Create a trigger to audit the data in a table.
CREATE TRIGGER AuditTransaction
ON [dbo].[Transaction]
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
    
END;

--16. Create a trigger to prevent login of the same user id in multiple pages.
CREATE TRIGGER PreventMultipleLogins
ON ALL SERVER
AFTER LOGON
AS
BEGIN
    IF EXISTS (
        SELECT 1
        FROM sys.dm_exec_sessions
        WHERE original_login_name = CURRENT_USER
        AND session_id <> @@SPID
    )
    BEGIN
        RAISEERROR('Multiple logins for the same user are not allowed.', 16, 1);
        ROLLBACK;
    END;
END;

--17. Display top n customers on the basis of transaction type.
DECLARE @n INT = 10; -- Change n to the desired number of customers
SELECT TOP (@n) customer_id, txn_type
FROM [dbo].[Transaction]
GROUP BY customer_id, txn_type
ORDER BY COUNT(*) DESC;

--18. Create a pivot table to display the total purchase, withdrawal and
--deposit for all the customers.SELECT *
FROM (
    SELECT customer_id, txn_type, txn_amount
    FROM [dbo].[Transaction]
) AS SourceTable
PIVOT (
    SUM(txn_amount)
    FOR txn_type IN ([purchase], [withdrawal], [deposit])
) AS PivotTable;
