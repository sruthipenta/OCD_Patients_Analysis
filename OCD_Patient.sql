-- Exploring the demographic characteristics of the sample population 

-- Age distribution
SELECT
    AVG(CAST(Age AS INT)) AS Average_Age,
    MIN(CAST(Age AS INT)) AS Min_Age,
    MAX(CAST(Age AS INT)) AS Max_Age
FROM
    ocd_patient_dataset;

-- Gender representation
SELECT
    Gender,
    COUNT(*) AS Total_Patients,
    ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM ocd_patient_dataset), 2) AS Percentage
FROM
    ocd_patient_dataset
GROUP BY
    Gender;

-- Ethnicity distribution
SELECT
    Ethnicity,
    COUNT(*) AS Total_Patients,
    COUNT(*) * 100.0 / (SELECT COUNT(*) FROM ocd_patient_dataset) AS Percentage
FROM
    ocd_patient_dataset
GROUP BY
    Ethnicity;

-- Marital status distribution
SELECT
    Marital_Status,
    COUNT(*) AS Total_Patients,
    COUNT(*) * 100.0 / (SELECT COUNT(*) FROM ocd_patient_dataset) AS Percentage
FROM
    ocd_patient_dataset
GROUP BY
    Marital_Status;

-- Date of OCD diagnosis and duration of symptoms
SELECT
    OCD_Diagnosis_Date,
    DATEDIFF(MONTH, OCD_Diagnosis_Date, GETDATE()) AS Duration_of_Symptoms_Months
FROM
    ocd_patient_dataset;

-- Previous psychiatric diagnoses
SELECT
    Distinct(Previous_Diagnoses)
FROM
    ocd_patient_dataset;

-- Co-occurring mental health conditions (e.g., depression, anxiety)

-- Co-occurring mental health conditions (e.g., depression, anxiety)
SELECT
    SUM(CASE WHEN Depression_Diagnosis = '1' AND Anxiety_Diagnosis = '1' THEN 1 ELSE 0 END) AS Patients_With_Both_Conditions,
    SUM(CASE WHEN Depression_Diagnosis = '1' OR Anxiety_Diagnosis = '0' THEN 1 ELSE 0 END) AS Patients_With_At_Least_One_Condition,
    SUM(CASE WHEN Depression_Diagnosis = '0' AND Anxiety_Diagnosis = '0' THEN 1 ELSE 0 END) AS Patients_With_None_Of_The_Conditions
FROM
    ocd_patient_dataset;

-- Categorizing Obsession and Compulsion Types
SELECT
    Obsession_Type,
    COUNT(*) AS Count
FROM
    ocd_patient_dataset
GROUP BY
    Obsession_Type;

SELECT
    Compulsion_Type,
    COUNT(*) AS Count
FROM
    ocd_patient_dataset
GROUP BY
    Compulsion_Type;

-- Assessing Severity Using Y-BOCS Scores
SELECT
    AVG(Y_BOCS_Score_Obsessions) AS Average_Obsession_Score,
    AVG(Y_BOCS_Score_Compulsions) AS Average_Compulsion_Score,
    MIN(Y_BOCS_Score_Obsessions) AS Min_Obsession_Score,
    MAX(Y_BOCS_Score_Obsessions) AS Max_Obsession_Score,
    MIN(Y_BOCS_Score_Compulsions) AS Min_Compulsion_Score,
    MAX(Y_BOCS_Score_Compulsions) AS Max_Compulsion_Score
FROM
    ocd_patient_dataset;

-- Identifying Common Medications and Their Frequencies
SELECT
    Medications,
    COUNT(*) AS Frequency
FROM
    ocd_patient_dataset
GROUP BY
    Medications
ORDER BY
    Frequency DESC;

-- Trend in medication prescriptions by gender
SELECT
    Gender,
    Medications,
    COUNT(*) AS Frequency
FROM
    ocd_patient_dataset
GROUP BY
    Gender, Medications
ORDER BY
    Gender, Frequency DESC;

-- Trend in medication prescriptions by age group
SELECT
    CASE
        WHEN Age < 30 THEN 'Under 30'
        WHEN Age >= 30 AND Age < 50 THEN '30 - 49'
        ELSE '50 and above'
    END AS Age_Group,
    Medications,
    COUNT(*) AS Frequency
FROM
    ocd_patient_dataset
GROUP BY
    CASE
        WHEN Age < 30 THEN 'Under 30'
        WHEN Age >= 30 AND Age < 50 THEN '30 - 49'
        ELSE '50 and above'
    END, Medications
ORDER BY
    Age_Group, Frequency DESC;

--Presence of Family History of OCD
SELECT
    Family_History_of_OCD,
    COUNT(*) AS Count
FROM
    ocd_patient_dataset
GROUP BY
    Family_History_of_OCD;

-- Association with gender
SELECT
    Gender,
    Family_History_of_OCD,
    COUNT(*) AS Count
FROM
    ocd_patient_dataset
GROUP BY
    Gender, Family_History_of_OCD;


-- Association with age group
SELECT
    CASE
        WHEN Age < 30 THEN 'Under 30'
        WHEN Age >= 30 AND Age < 50 THEN '30 - 49'
        ELSE '50 and above'
    END AS Age_Group,
    Family_History_of_OCD,
    COUNT(*) AS Count
FROM
    ocd_patient_dataset
GROUP BY
    CASE
        WHEN Age < 30 THEN 'Under 30'
        WHEN Age >= 30 AND Age < 50 THEN '30 - 49'
        ELSE '50 and above'
    END, Family_History_of_OCD;














