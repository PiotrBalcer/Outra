--1

WITH CTE AS (
    SELECT 
        l.MESSAGE_TIMESTAMP,
        l.LISTING_ID,
        a.ADDRESS, 
        l.PRICE, 
        LTRIM(SUBSTRING(a.ADDRESS, LEN(a.ADDRESS) - CHARINDEX(',', REVERSE(a.ADDRESS)) + 2, LEN(a.ADDRESS))) AS POSTCODE,
        RANK() OVER(PARTITION BY l.LISTING_ID ORDER BY l.UPDATE_DATE DESC) AS r
    FROM 
        [dbo].[listings] l 
    INNER JOIN 
        [dbo].[addresses] a 
    ON 
        l.RK = a.ADDR_ID
)
SELECT 
    LISTING_ID, 
    ADDRESS, 
    PRICE, 
    POSTCODE
FROM 
    CTE
WHERE 
    r = 1;

--------------------------
--------------------------

--2

WITH CTE AS (
    SELECT 
        l.LISTING_ID,
        l.LISTING_STATUS,
        l.PRICE,
        l.UPDATE_DATE,
        RANK() OVER(PARTITION BY l.LISTING_ID ORDER BY l.UPDATE_DATE ASC) AS r
    FROM 
        [dbo].[listings] l 
    INNER JOIN 
        [dbo].[addresses] a 
    ON 
        l.RK = a.ADDR_ID
    WHERE 
        l.LISTING_STATUS = 'sale_under_offer'
)
SELECT 
    LISTING_ID, 
    LISTING_STATUS, 
    PRICE, 
    UPDATE_DATE
FROM 
    CTE
WHERE 
    r = 1;

--------------------------------------
--------------------------------------

--3

SELECT 
    ROUND(AVG(l.PRICE), 2) AS avg_price, 
    a.ADDRESS 
FROM 
    [dbo].[listings] l 
FULL JOIN 
    [dbo].[addresses] a 
ON 
    l.RK = a.ADDR_ID
GROUP BY 
    a.ADDRESS;


-----------------------------------
-----------------------------------

--4

SELECT TOP 5 
    (MAX(l.PRICE) - MIN(l.PRICE)) AS price_dif, 
    l.LISTING_ID
FROM 
    [dbo].[listings] l 
INNER JOIN 
    [dbo].[addresses] a 
ON 
    l.RK = a.ADDR_ID
GROUP BY 
    l.LISTING_ID
ORDER BY 
    price_dif DESC;
