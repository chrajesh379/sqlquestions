--https://www.youtube.com/watch?v=k8AznxLnpgA

[^,] - any character except comma
+ - one or more times
() - captures this part as group 1

Ex: REGEXP_EXTRACT(features_inuse_no,r'(?)ENCRYPTION:([^,]+)')
How it executes:

  Searches for the literal text "ENCRYPTION:"
  Captures everything after it until it hits a comma or end of string
  Returns only the captured group (the part in parentheses)

SELECT REGEXP_EXTRACT('ENCRYPTION:true,COMPRESSION:false', r'ENCRYPTION:([^,]+)') as result
  returns true



SELECT province_state,country_region,combined_key,
REGEXP_EXTRACT(combined_key,r"^[^,]*") AS city -- starting with any number of characters except , 
-- It will pull entire substring till it find , 
-- * means 0 or more number of characters
FROM `bigquery-public-data.covid19_jhu_csse.summary`
WHERE date='2020-04-04'

;


with cte as (
  SELECT """2024-10-13 12:02:01,938 STUDENT-INFO  :{'enabled': '123456789'}#abcdfed updatee: student_number: 132546$ Class: 2$ Address: $ Maths: 70$ English: 60$ Chemistry: 45$ Physics: 80$ city: Bangalore$ 
""" AS col_value
)
SELECT col_value
-- starting from student_number string with any number of characters  
,REGEXP_EXTRACT(col_value,r"student_number:\s.*") student_number_after 
-- starting from student_number string with any number of characters except student_number: text 
-- when ever we have used () it will behave like capturing group (submatch)
-- After the entire match, It will remove student_number:
,REGEXP_EXTRACT(col_value,r"student_number:\s(.*)") student_number_after_without_text
-- starting from student_number string with any number of characters except student_number: text 
-- when ever we have used () it will behave like capturing group (submatch)
-- in the submatch doesn't start with $
,REGEXP_EXTRACT(col_value,r"student_number:\s([^\$]*)") student_number
,REGEXP_EXTRACT(col_value,r"Class:\s([^\$]*)") Class
,REGEXP_EXTRACT(col_value,r"Address:\s([^\$]*)") Address
FROM cte

;



