-- Explore DATA 
-- Toatl Records
SELECT * 
FROM pan_dataset;   -- Total Count 10,000

-- Check for Missing DATA
SELECT pan_number, COUNT(1) as count
FROM pan_dataset
WHERE pan_number IS NULL
GROUP BY pan_number;

-- Check for DUPLICATE
SELECT pan_number, COUNT(1) as count
FROM pan_dataset
GROUP BY pan_number
HAVING COUNT(1) > 1;

-- Check for Leading/Trailing Extra Spaces
SELECT pan_number
FROM pan_dataset
WHERE pan_number <> TRIM(pan_number);

-- Check for Letter Caseing
SELECT COUNT(1) as count
FROM pan_dataset
WHERE pan_number <> UPPER(pan_number);