# Health Insurance Claims Analysis | SQL & Power BI

## Overview

This project focuses on analyzing health insurance claims to understand claim status, rejection patterns, trends, and differences across patient and provider categories.

I worked with 4,500 records using PostgreSQL for data analysis and Power BI to build an interactive dashboard. The analysis covers claim status distribution, rejection patterns, claim amounts, and patient demographics.

## Dashboard Preview

### Claims Dashboard

![Claims Dashboard](./Health%20Insurance%20Claim%20Analysis/screenshots/dashboard_overview.png)

### Insights & Business Findings

![Insights & Business Findings](./Health%20Insurance%20Claim%20Analysis/screenshots/insights_page.png)

## Dataset

**Source:** [Enhanced Health Insurance Claims Dataset – Kaggle](https://www.kaggle.com/datasets/leandrenash/enhanced-health-insurance-claims-dataset)

- Records: 4,500
- Columns: 17
- Domain: Healthcare Insurance
- Format: CSV

The dataset contains claim details, patient demographics, provider information, claim amounts, dates, and submission methods.

## Tools & Technologies

- **PostgreSQL** – Data exploration and SQL analysis
- **Power BI** – Dashboard development and visualization
- **DAX** – Measures and calculations
- **Power Query** – Data cleaning and transformation

## Analysis Performed

- Overall claim status distribution
- Claim rejection patterns by claim type
- Rejections by submission method
- Provider specialty analysis
- Monthly and yearly claim trends
- Claim amount comparisons by status
- Patient age group analysis
- Patient income comparisons across claim statuses

## Key Findings

### Claim Status Distribution

| Claim Status | Claims | Percentage |
|---|---:|---:|
| Approved | 1,522 | 33.82% |
| Denied | 1,512 | 33.60% |
| Pending | 1,466 | 32.58% |
| **Total** | **4,500** | **100%** |

### Other Observations

- Outpatient claims recorded the highest denied count among claim types, with 388 claims.
- Online submissions recorded the highest denied count among submission methods, with 525 claims.
- Pediatrics had the highest denied count among provider specialties, with 321 claims.
- 2023 had the highest claim volume, with 2,309 claims.
- 2024 recorded the highest yearly denial rate, at 35.55%.
- The 51–65 age group had the highest denial rate, at 35.98%.

These findings describe patterns in the dataset. Denied counts and denial rates are different measures and should be interpreted accordingly.

## Repository Structure

```text
Repository/
│
├── Health Insurance Claim Analysis/
│   │
│   ├── data/
│   │   └── enhanced_health_insurance_claims.csv
│   │
│   ├── documentation/
│   │   ├── HealthClaims_Reports.pdf
│   │   └── Health_Insurance_Claims_Analysis_Carousel.pdf
│   │
│   ├── powerbi/
│   │   └── Health_Insurance_Claims_Dashboard.pbix
│   │
│   ├── screenshots/
│   │   ├── dashboard_overview.png
│   │   └── insights_page.png
│   │
│   └── sql/
│       └── Claim_Rejection_Analysis.sql
│
└── README.md
```

## Limitations

- The dataset does not provide specific reasons for claim denials.
- Claim amounts represent submitted amounts, not actual payouts.
- Processing duration and payment information are unavailable.
- Diagnosis and procedure codes do not include descriptions.
- The analysis identifies patterns and associations, not causal relationships.
- Monthly comparisons combine the same calendar months across different years.

## Conclusion

This project gave me an opportunity to apply SQL and Power BI to a healthcare-related dataset. It involved exploring the data, writing analytical queries, calculating KPIs, identifying patterns, and presenting the findings through an interactive dashboard.

## About Me

**Raghuram Beldon**  
M.Sc. Computer Science | Aspiring Data Analyst

[LinkedIn](https://www.linkedin.com/in/beldon-raghuram-73a2b22b/) | [GitHub](https://github.com/Raghurambeldon)
