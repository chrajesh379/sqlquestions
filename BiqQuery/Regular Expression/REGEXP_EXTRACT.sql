--https://www.youtube.com/watch?v=k8AznxLnpgA
SELECT province_state,country_region,combined_key,
REGEXP_EXTRACT(combined_key,r"^[^,]*") AS city -- starting with any number of characters except , 
-- It will pull entire substring till it find , 
-- * means 0 or more number of characters
FROM `bigquery-public-data.covid19_jhu_csse.summary`
WHERE date='2020-04-04'

;
