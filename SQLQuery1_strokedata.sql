SELECT * 
FROM dbo.healtcare_data_csv;

--altered column stroke to INT

ALTER TABLE dbo.healtcare_data_csv
ALTER COLUMN stroke int;

--Looking at relationship between age and stroke

SELECT
  AVG(age) AS avg_age,
  COUNT(*) AS total_patients,
  SUM(stroke) AS stroke_count
FROM dbo.healtcare_data_csv;



--looking at disparities in gender

SELECT
  gender,
  COUNT(*) as total_patients,
  SUM(stroke) as stroke_count
FROM dbo.healtcare_data_csv
GROUP BY gender;

--Looking at smoking status

SELECT
  smoking_status,
  COUNT(*) as total_patients,
  SUM(stroke) as stroke_count
FROM dbo.healtcare_data_csv
GROUP BY smoking_status;

--looking at hypertension

SELECT
  hypertension,
  COUNT(*) as total_patients,
  SUM(stroke) as stroke_count
FROM dbo.healtcare_data_csv
GROUP BY hypertension;

--looking at marital status


SELECT
  ever_married,
  COUNT(*) as total_patients,
  SUM(stroke) as stroke_count
FROM dbo.healtcare_data_csv
GROUP BY ever_married;

--looking at heart disease

SELECT
  heart_disease,
  COUNT(*) as total_patients,
  SUM(stroke) as stroke_count
FROM dbo.healtcare_data_csv
GROUP BY heart_disease;

--looking at residence

SELECT
  Residence_type,
  COUNT(*) total_patients,
  SUM(stroke) as stroke_count
FROM dbo.healtcare_data_csv
GROUP BY Residence_type;

--Showing average age of stroke patients

SELECT gender, AVG(age) AS avg_age
FROM dbo.healtcare_data_csv
WHERE stroke = 1
GROUP BY gender;

--Calculating age range

SELECT MIN(age) AS min_age, MAX(age) AS max_age
FROM dbo.healtcare_data_csv
WHERE stroke = 1;

--Percentage of patients

SELECT 
  CASE 
    WHEN age < 50 THEN 'Under 50' 
    WHEN age BETWEEN 50 AND 59 THEN '50-59' 
    WHEN age BETWEEN 60 AND 69 THEN '60-69' 
    WHEN age BETWEEN 70 AND 79 THEN '70-79' 
    ELSE '80 and over' 
  END AS age_range,
  COUNT(*) AS total_patients,
  COUNT(CASE WHEN stroke = 1 THEN 1 END) AS stroke_count,
  (CAST(COUNT(CASE WHEN stroke = 1 THEN 1 END) AS FLOAT) / COUNT(*)) * 100 AS stroke_percentage
FROM dbo.healtcare_data_csv
GROUP BY 
  CASE 
    WHEN age < 50 THEN 'Under 50' 
    WHEN age BETWEEN 50 AND 59 THEN '50-59' 
    WHEN age BETWEEN 60 AND 69 THEN '60-69' 
    WHEN age BETWEEN 70 AND 79 THEN '70-79' 
    ELSE '80 and over' 
  END;
