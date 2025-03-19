USE chinook;

# 1.)Top 5 Customers by Total Purchase Amount:
SELECT 
    c.CustomerId,
    CONCAT(c.FirstName, ' ', c.LastName) AS CustomerName,
    SUM(i.Total) AS TotalSpent
FROM Customer c
JOIN Invoice i ON c.CustomerId = i.CustomerId
GROUP BY c.CustomerId, CustomerName
ORDER BY TotalSpent DESC
LIMIT 5;

# 2.)Most Popular Genres:
SELECT 
    g.Name AS Genre,
    COUNT(il.TrackId) AS TracksSold
FROM genre g
JOIN Track t ON g.GenreId = t.GenreId
JOIN InvoiceLine il ON t.TrackId = il.TrackId
GROUP BY g.Name
ORDER BY TracksSold DESC;

# 3.) Top-Selling Albums:
SELECT 
    al.Title AS Album,
    ar.Name AS Artist,
    COUNT(il.TrackId) AS TracksSold
FROM Album al
JOIN Artist ar ON al.ArtistId = ar.ArtistId
JOIN Track t ON al.AlbumId = t.AlbumId
JOIN InvoiceLine il ON t.TrackId = il.TrackId
GROUP BY al.Title,ar.Name
ORDER BY TracksSold DESC;

# 4.) Employee Sales Performance:
SELECT 
    e.EmployeeId,
    CONCAT(e.FirstName, ' ', e.LastName) AS EmployeeName,
    SUM(i.Total) AS TotalSales
FROM Employee e
JOIN Customer c ON e.EmployeeId = c.SupportRepId
JOIN Invoice i ON c.CustomerId = i.CustomerId
GROUP BY e.EmployeeId, EmployeeName
ORDER BY TotalSales DESC
LIMIT 1;

# 5.) Customers by Country:
SELECT 
    c.Country,
    COUNT(i.CustomerId) AS CustomerCount,
    SUM(i.Total) AS TotalRevenue
FROM Customer c
JOIN Invoice i ON c.CustomerId = i.CustomerId
GROUP BY c.Country
ORDER BY TotalRevenue DESC;

