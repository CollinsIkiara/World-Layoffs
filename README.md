# World Layoffs Data Analysis

## Project Overview
This project analyzes global layoffs across various industries and companies. The data highlights the impact of layoffs on employees, companies, and industries. The main goals are to:

- Identify trends in layoffs across time, regions, and industries.
- Quantify the severity of layoffs and understand their correlation with factors such as funding stage.
- Provide actionable insights through visualizations and statistical analyses.

---

## Dataset

### File: `layoffs_staging2.csv`
The dataset contains 1,995 records with the following columns:

| Column                  | Description                                                               |
|-------------------------|---------------------------------------------------------------------------|
| **company**             | Name of the company.                                                      |
| **location**            | Location of the company (city).                                           |
| **industry**            | Type of industry (e.g., Media, Retail, Technology).                       |
| **total_laid_off**      | Total number of employees laid off.                                       |
| **percentage_laid_off** | Percentage of employees laid off.                                         |
| **date**                | Date when the layoffs occurred.                                           |
| **stage**               | Funding stage of the company (e.g., Series B, Post-IPO).                  |
| **country**             | Country where the company is based.                                       |
| **funds_raised_millions** | Total funds raised by the company in millions of dollars.                |

---

## Data Cleaning
The data cleaning process involved the following steps:
1. **Removing Duplicates**: A staging table was created, and duplicate records were removed to maintain data integrity.
2. **Handling Null Values**: Key columns such as `total_laid_off` and `industry` were carefully imputed or cleaned to avoid skewing analyses.
3. **Standardization**: Date formats and text columns were standardized for consistency.
4. **Column Selection**: Unnecessary columns were dropped for a cleaner dataset.

---

## Exploratory Data Analysis (EDA)
The EDA process included the following:

1. **Data Loading**:
  - The `layoffs_staging2.csv` cleaned dataset was used.
    
2. **Layoffs By Industry**:
   - Correlation between `industry` and `total_laid_off`.
   
3. **Trends in Layoffs over Time**:
   - Layoffs By Month.
   - Layoffs By Year.

4. **Layoffs By Stage of Funding**:
   - Correlation between `stage` and `total_laid_off`.
  
5. **Countries with the Most Layoffs**
   - Correlation between `country` and `total_laid_off`.

6. **Additional Insights**:
   - Companies with 100% layoffs were identified.
   - Top companies with the highest total layoffs were listed.

---

## Key Insights
1. **Industries Most Affected**: The Consumer and Retail sectors experienced the highest layoffs, driven by economic downturns and shifts in business models.
2. **Funding Stages**: Companies at the Post-IPO stage of funding were more vulnerable to layoffs, showing that companies that go public are most vulnerable to layoffs.
3. **Geographic Distribution**: The United States and India were the most affected countries in terms of layoffs, reflecting their large startup ecosystems.
4. **Trends Over Time**: Layoffs peaked during periods of economic uncertainty and decreased as market conditions stabilized.

---

## Recommendations
1. **Support Vulnerable Sectors**: Focus on providing support and funding to industries most affected by layoffs, especially during economic downturns.
2. **Monitor Company Funding Stages**: Monitor companies at specific funding stages for early signs of mass layoffs. Especially companies at the Post-IPO stage.
3. **Geographic Focus**: Policymakers should provide region-specific support, especially in countries with high layoff rates.
4. **Improve Data Collection**: More granular data on employee roles and layoff reasons can enhance predictive models for future workforce planning.

---

## How to Use This Repository
1. **Data Cleaning**:
   - Refer to `01_Data_Cleaning.sql` for SQL scripts used in data cleaning.
   - Ensure the cleaned dataset is ready for analysis.

2. **EDA**:
   - Refer to `02_EDA.sql` and `world_layoffs_eda.ipynb` for exploratory data analysis.
   - Review the notebook as well as the `world_layoffs_report.pdf` for visualizations and insights.

3. **Insights and Recommendations**:
   - Summarized in this README file, Jupyter Notebook as well as the `world_layoffs_report.pdf` report.

---

## Next Steps
1. Build predictive models to forecast future layoffs.
2. Incorporate additional datasets for a more comprehensive analysis.
3. Explore deeper causal relationships using advanced statistical methods.

---

## Acknowledgments
- The dataset was curated from publicly available information on layoffs.
- Data cleaning and preparation scripts were authored to ensure data quality.

