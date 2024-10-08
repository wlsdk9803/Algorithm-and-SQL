WITH COUNT_DATA AS 
(SELECT PARENT_ID AS ID, COUNT(*) AS CHILD_COUNT FROM ECOLI_DATA
WHERE PARENT_ID IS NOT NULL
GROUP BY PARENT_ID)

SELECT ECOLI_DATA.ID, IFNULL(COUNT_DATA.CHILD_COUNT, 0) AS CHILD_COUNT 
FROM ECOLI_DATA
LEFT JOIN COUNT_DATA ON ECOLI_DATA.ID = COUNT_DATA.ID 
ORDER BY ID;