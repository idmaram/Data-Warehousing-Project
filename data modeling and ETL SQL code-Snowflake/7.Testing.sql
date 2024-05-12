-- 1- not null testing:
-- compare count = 0 ==> True:it is great we didn't have null value, False: the  
select count(*)=0 from TPCDS.ANALYTICS.CUSTOMER_DIM
where customer_sk is null;
    -- Result: 
    -- count = 0 ==> True


-- 2- unique test:
-- the grain should be unique
select count(*)=0 from 
    (select warehouse_sk, item_sk ,sold_wk_sk
    from TPCDS.ANALYTICS.WEEKLY_SALES_INVENTORY
    group by 1,2,3
    having count(*) >1
    );
    -- Result:
    -- count = 0 ==> True


-- 3- Relationsgip test:
SELECT COUNT(*) = 0 FROM (
        SELECT DIM.I_ITEM_SK
        FROM TPCDS.ANALYTICS.WEEKLY_SALES_INVENTORY FACT
        LEFT JOIN TPCDS.RAW.ITEM DIM
        ON DIM.I_ITEM_SK = FACT.ITEM_SK
        WHERE DIM.I_ITEM_SK IS NULL);

-- accepted value
SELECT COUNT(*) = 0 
FROM TPCDS.ANALYTICS.WEEKLY_SALES_INVENTORY
WHERE warehouse_sk NOT IN (1,2,3,4,5);

-- Weekly Customer Count

-- purchase_wk_sk is unique
SELECT COUNT(*) = 0 
FROM TPCDS.ANALYTICS.WEEKLY_CUSTOMER_COUNT
WHERE purchase_wk_sk is null;

-- relationship
SELECT COUNT(*) = 0 FROM (
        SELECT DIM.D_DATE_SK
        FROM TPCDS.ANALYTICS.WEEKLY_CUSTOMER_COUNT FACT
        LEFT JOIN TPCDS.RAW.DATE_DIM DIM
        ON DIM.D_DATE_SK = FACT.PURCHASE_WK_SK
        WHERE DIM.D_DATE_SK IS NULL);
