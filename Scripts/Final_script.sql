-- 1. CTE for cleaning Data remove duplicate, remove extra space, conver to upper case
WITH clean_data AS (
                    SELECT DISTINCT UPPER(TRIM(pan_number)) as pan_number
                    FROM pan_dataset
                    WHERE TRIM(pan_number) <> ''
    )
-- 2. CTE for PAN Format Validation 
    , valid_data AS (
                    SELECT pan_number
                    FROM clean_data
                    WHERE dbo.chk_adj_char(pan_number) = 0
                    AND   dbo.chk_seq_char(SUBSTRING(pan_number,1,5)) = 0
                    AND   dbo.chk_seq_char(SUBSTRING(pan_number,6,4)) = 0
                    AND   pan_number LIKE '[A-Z][A-Z][A-Z][A-Z][A-Z][0-9][0-9][0-9][0-9][A-Z]'
    )
-- 3. CTE for Categorisation of Pan Number into Valid and Invalid 
    , categorized_data as (
                    SELECT c.pan_number,
                           CASE WHEN v.pan_number IS NOT NULL 
                            THEN 'Valid' 
                            ELSE 'Invalid' 
                           END as status
                    FROM clean_data as c
                    LEFT JOIN valid_data as v
                    ON c.pan_number = v.pan_number
    )                
-- 4. Summary Report    
SELECT (SELECT COUNT(*) FROM pan_dataset) as Total_records,
       SUM( CASE WHEN status = 'Valid' THEN 1 ELSE 0 END) as Total_valid_pan,
       SUM( CASE WHEN status = 'Invalid' THEN 1 ELSE 0 END) as Total_invalid_pan,
       (SELECT COUNT(*) FROM pan_dataset) - (SELECT COUNT(*) FROM clean_data) as Missing_records
FROM categorized_data         

