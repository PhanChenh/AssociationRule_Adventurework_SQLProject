
--===========--ASSOCIATION RULE ANALYSIS

/*

Association rules are a fundamental concept in data mining, often used to discover relationships or patterns in large datasets, particularly in market basket analysis. The goal is to identify how items or events are related to each other, which can then inform decision-making, promotions, product placements, and more.

*/

select * from sales.SalesOrderHeader;
select * from sales.SalesOrderDetail;

-- Need to know total distinct order:
SELECT COUNT(DISTINCT SalesOrderID) AS DistinctOrders
FROM Sales.SalesOrderDetail;

--------------------------

-- Step 1: Get a normalized transaction table
SELECT 
    SOD.SalesOrderID,
    SOD.ProductID,
    P.Name AS ProductName
INTO #TransactionData
FROM Sales.SalesOrderDetail SOD
JOIN Production.Product P
    ON SOD.ProductID = P.ProductID;


-- Step 2: Count total number of transactions
SELECT 
    COUNT(DISTINCT SalesOrderID) AS TotalTransactions
INTO #TotalTransactions
FROM #TransactionData;

-- Step 3: Calculate support for individual products
SELECT 
    ProductID,
    ProductName,
    COUNT(DISTINCT SalesOrderID) AS TransactionCount,
    COUNT(DISTINCT SalesOrderID) * 1.0 / (SELECT TotalTransactions FROM #TotalTransactions) AS Support
INTO #ProductSupport
FROM #TransactionData
GROUP BY ProductID, ProductName
ORDER BY Support DESC;


-- Step 4: Calculate support for product pairs
SELECT 
    T1.ProductID AS ProductA,
    T1.ProductName AS ProductAName,
    T2.ProductID AS ProductB,
    T2.ProductName AS ProductBName,
    COUNT(DISTINCT T1.SalesOrderID) AS PairCount,
    COUNT(DISTINCT T1.SalesOrderID) * 1.0 / (SELECT TotalTransactions FROM #TotalTransactions) AS Support
INTO #PairSupport
FROM #TransactionData T1
JOIN #TransactionData T2
    ON T1.SalesOrderID = T2.SalesOrderID
    AND T1.ProductID < T2.ProductID  -- Prevent duplicate pairs (A, B) and (B, A)
GROUP BY T1.ProductID, T1.ProductName, T2.ProductID, T2.ProductName
ORDER BY Support DESC;


-- Step 5: Calculate confidence for product pairs
SELECT 
    PS.ProductA,
    PS.ProductAName,
    PS.ProductB,
    PS.ProductBName,
    PS.Support AS PairSupport,
    PS.PairCount,
    PS.PairCount * 1.0 / PS_A.TransactionCount AS Confidence
INTO #PairConfidence
FROM #PairSupport PS
JOIN #ProductSupport PS_A
    ON PS.ProductA = PS_A.ProductID
ORDER BY Confidence DESC;


-- Step 6: Calculate lift for product pairs and show the final result

SELECT 
    PC.ProductA,
    PC.ProductAName,
    PC.ProductB,
    PC.ProductBName,
    PC.PairSupport,
    PC.PairCount, 
    PC.Confidence,
    PC.PairSupport / (PS_A.Support * PS_B.Support) AS Lift, 
    PS_A.Support AS ProductASupport,  -- Support for ProductA
    PS_B.Support AS ProductBSupport   -- Support for ProductB
FROM #PairConfidence PC
JOIN #ProductSupport PS_A
    ON PC.ProductA = PS_A.ProductID   -- Join for ProductA support
JOIN #ProductSupport PS_B
    ON PC.ProductB = PS_B.ProductID   -- Join for ProductB support
WHERE 
    PC.Confidence > 0.5 
    AND PC.PairSupport > 0.01 
    AND PS_B.Support > 0.01 
ORDER BY Lift DESC, Confidence DESC;


-- Step 7: Cleanup
DROP TABLE #TransactionData;
DROP TABLE #TotalTransactions;
DROP TABLE #ProductSupport;
DROP TABLE #PairSupport;
DROP TABLE #PairConfidence;








