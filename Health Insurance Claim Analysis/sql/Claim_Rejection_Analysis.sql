CREATE TABLE claims_data (
ClaimID VARCHAR(50),
PatientID VARCHAR(50),
ProviderID VARCHAR(50),
ClaimAmount FLOAT,
ClaimDate DATE ,
DiagnosisCode VARCHAR(20),
ProcedureCode VARCHAR(20),
PatientAge SMALLINT,
PatientGender VARCHAR(5),
ProviderSpecialty  VARCHAR(20),
ClaimStatus VARCHAR(20),
PatientIncome FLOAT,
PatientMaritalStatus VARCHAR(20),
PatientEmploymentStatus VARCHAR(20),
ProviderLocation VARCHAR(40),
ClaimType VARCHAR(20),
ClaimSubmissionMethod VARCHAR(20)
);



SELECT * FROM claims_data LIMIT 10;

-- TOTAL CLAIMS
SELECT COUNT(*) AS Total_Claims FROM claims_data; 

-- Total Claims By Claim Status
SELECT ClaimStatus AS Claim_Status ,COUNT(*) AS Total_Claims 
FROM claims_data 
GROUP BY ClaimStatus;

-- %

SELECT 
    ClaimStatus AS Claim_Status,
    ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM claims_data), 2) AS Percentage
FROM 
    claims_data 
GROUP BY 
    ClaimStatus;
	
-- Claim rejection Segmentation

SELECT 
    ClaimType, 
    COUNT(ClaimId) AS Rejected_claims 
FROM 
    claims_data
WHERE 
    ClaimStatus = 'Denied'
GROUP BY 
    ClaimType
	ORDER BY Rejected_Claims DESC;



-- rejections by ClaimSubmissionMethod

SELECT 
    ClaimSubmissionMethod, 
    COUNT(ClaimId) AS Rejected_claims 
FROM 
    claims_data
WHERE 
    ClaimStatus = 'Denied'
GROUP BY 
    ClaimSubmissionMethod
	ORDER BY Rejected_Claims DESC;

-- Rejections by ProviderSpecialty

SELECT 
    ProviderSpecialty, 
    COUNT(ClaimId) AS Rejected_claims 
FROM 
    claims_data
WHERE 
    ClaimStatus = 'Denied'
GROUP BY 
    ProviderSpecialty
    ORDER BY Rejected_Claims DESC;

-- Rejections BY ProviderLocation

SELECT 
    providerlocation, 
    COUNT(ClaimId) AS Rejected_claims 
FROM 
    claims_data
WHERE 
    ClaimStatus = 'Denied'
GROUP BY 
   providerlocation
    ORDER BY Rejected_Claims DESC
	LIMIT 10;

-- Trend/Time  Analysis

--Per Month
SELECT 
    EXTRACT(MONTH FROM ClaimDate) AS Months,
    COUNT(CASE WHEN ClaimStatus = 'Denied' THEN 1 END) AS Denied_Claims,
    COUNT(*) AS Total_Claims,
    ROUND(
        (COUNT(CASE WHEN ClaimStatus = 'Denied' THEN 1 END)::NUMERIC / COUNT(*)) * 100, 
        2
    ) AS Denied_Percentage
FROM claims_data
GROUP BY EXTRACT(MONTH FROM ClaimDate)
ORDER BY Months;

-- Per Year
SELECT 
    EXTRACT(YEAR FROM ClaimDate) AS Years,
    COUNT(CASE WHEN ClaimStatus = 'Denied' THEN 1 END) AS Denied_Claims,
    COUNT(*) AS Total_Claims,
    ROUND(
        (COUNT(CASE WHEN ClaimStatus = 'Denied' THEN 1 END)::NUMERIC / COUNT(*)) * 100, 
        2
    ) AS Denied_Percentage
FROM claims_data
GROUP BY EXTRACT(YEAR FROM ClaimDate)
ORDER BY Years;



-- STATISTICAL ANALYSIS 

SELECT 
    COUNT(*) AS Number_of_Claims,
    ROUND(AVG(ClaimAmount)::numeric, 2) AS Average_Claim_Amount,
    PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY ClaimAmount) AS Median_Claim_Amount,
    MIN(ClaimAmount) AS Minimum_Claim_Amount,
    MAX(ClaimAmount) AS Maximum_Claim_Amount
FROM claims_data;


SELECT 
    ClaimStatus,
    COUNT(*) AS Total_Claims,
    ROUND(AVG(ClaimAmount)::numeric, 2) AS Avg_Amount,
    PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY ClaimAmount) AS Median_Amount
FROM claims_data
GROUP BY ClaimStatus
ORDER BY Median_Amount DESC;


SELECT 
    CASE 
        WHEN PatientAge < 18 THEN 'Under 18'
        WHEN PatientAge BETWEEN 18 AND 35 THEN '18-35'
        WHEN PatientAge BETWEEN 36 AND 50 THEN '36-50'
        WHEN PatientAge BETWEEN 51 AND 65 THEN '51-65'
        ELSE '65+' 
    END AS Age_Group,
    COUNT(*) AS Total_Claims,
    COUNT(CASE WHEN ClaimStatus = 'Denied' THEN 1 END) AS Denied_Claims,
    ROUND((COUNT(CASE WHEN ClaimStatus = 'Denied' THEN 1 END)::numeric / COUNT(*)) * 100, 2) AS Denial_Rate_Pct
FROM claims_data
GROUP BY 1
ORDER BY Age_Group;





SELECT 
    DiagnosisCode,
    ProcedureCode,
    COUNT(*) AS Total_Claims,
    COUNT(CASE WHEN ClaimStatus = 'Denied' THEN 1 END) AS Denied_Claims,
    ROUND((COUNT(CASE WHEN ClaimStatus = 'Denied' THEN 1 END)::numeric / COUNT(*)) * 100, 2) AS Denial_Rate_Pct
FROM claims_data
GROUP BY DiagnosisCode, ProcedureCode
ORDER BY Denial_Rate_Pct DESC
LIMIT 10;

-- Patient Income by Claim Status

SELECT claimstatus,round(avg(PatientIncome)::numeric,2) as average_patient_income ,
PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY PatientIncome) AS median_value
from claims_data
group by claimstatus;
