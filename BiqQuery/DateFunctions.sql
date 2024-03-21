SELECT CASE WHEN EXTRACT(DAYOFWEEK FROM CURRENT_DATE()) = 1 THEN CURRENT_DATE() ELSE DATE_TRUNC(CURRENT_DATE(), WEEK(SUNDAY))+7 END AS next_sunday
