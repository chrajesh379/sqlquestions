with cte as 
(
  SELECT '2024-01-01' AS snapshot_date
  UNION ALL
  SELECT '2024-01-02' AS snapshot_date
    UNION ALL
  SELECT '2024-01-03' AS snapshot_date
      UNION ALL
  SELECT '2024-01-04' AS snapshot_date
      UNION ALL
  SELECT '2024-01-10' AS snapshot_date
       UNION ALL
  SELECT '2024-01-11' AS snapshot_date
         UNION ALL
  SELECT '2024-01-12' AS snapshot_date
           UNION ALL
  SELECT '2024-01-14' AS snapshot_date
             UNION ALL
  SELECT '2024-01-17' AS snapshot_date
               UNION ALL
  SELECT '2024-01-18' AS snapshot_date
),
cte_1 AS (
SELECT date(snapshot_date) as snapshot_date ,COALESCE(LEAD(date(snapshot_date),1)OVER(order by snapshot_date),date(CURRENT_DATE())) prev_snapshot_date FROM cte
)

--select * from cte_1
select fp.date,cte_1.snapshot_date--, cte_1.prev_snapshot_date 
inner join cte_1 on fp.date>= cte_1.snapshot_date and fp.date<cte_1.prev_snapshot_date
order by 1
