# World Layoffs Data Analysis

## Project Overview
This project analyzes global layoffs across various industries and companies. The data highlights the impact of layoffs on employees, companies, and industries. The main goals are to:

- Identify trends in layoffs across time, regions, and industries.
- Quantify the severity of layoffs and understand their correlation with factors such as funding stage and funds raised.
- Provide actionable insights through visualizations and statistical analyses.

The project will proceed through the following stages:

1. **Data Cleaning** (Completed)
2. **Exploratory Data Analysis (EDA)** (Completed)
3. **Insights and Recommendations**
4. **Modeling (Optional)**

---

## Dataset

### File: `layoffs_staging2.csv`

The dataset contains 1,995 records with the following columns:

| Column                 | Description                                                                 |
|------------------------|-----------------------------------------------------------------------------|
| **company**            | Name of the company.                                                       |
| **location**           | Location of the company (city).                                            |
| **industry**           | Type of industry (e.g., Media, Retail, Technology).                        |
| **total_laid_off**     | Total number of employees laid off.                                        |
| **percentage_laid_off**| Percentage of employees laid off.                                          |
| **date**               | Date when the layoffs occurred.                                            |
| **stage**              | Funding stage of the company (e.g., Series B, Post-IPO).                   |
| **country**            | Country where the company is based.                                        |
| **funds_raised_millions** | Total funds raised by the company in millions of dollars.                 |

### Key Points:
- The cleaned dataset has 1,995 records, reduced from 2,361 after cleaning.
- Missing values remain in some columns, such as `industry`, `percentage_laid_off`, and `date`.
- Duplicates and irrelevant records have been removed.

---

## Data Cleaning
The data cleaning process involved the following steps:

1. **Removing Duplicates**:
   - A staging table was created to preserve the raw data.
   - Duplicate records were identified and removed.

2. **Handling Null Values**:
   - Columns with significant null values were either imputed with appropriate values or excluded.
   - Null values in key columns like `total_laid_off` were handled carefully to avoid skewing analyses.

3. **Standardization**:
   - Date formats were standardized.
   - Text columns (e.g., `industry`, `location`) were standardized to ensure uniformity.

4. **Column Selection**:
   - Unnecessary or redundant columns were removed.

The SQL script used for cleaning is stored in `01_Data_Cleaning.sql`.

---

## Exploratory Data Analysis (EDA)
**Status**: Completed.

The following analyses were conducted during the EDA phase:

1. **Univariate Analysis**:
   - **Distribution of layoffs by industry, location, and funding stage**:
     ```sql
     SELECT industry, SUM(total_laid_off)
     FROM layoffs_staging2
     GROUP BY industry
     ORDER BY 2 DESC;
     ```

   - **Trends in layoffs over time**:
     ```sql
     SELECT YEAR(`date`), SUM(total_laid_off)
     FROM layoffs_staging2
     GROUP BY YEAR(`date`)
     ORDER BY 1 DESC;
     ```

2. **Bivariate and Multivariate Analysis**:
   - **Correlation between `funds_raised_millions` and `total_laid_off`**:
     ```sql
     SELECT funds_raised_millions, total_laid_off
     FROM layoffs_staging2;
     ```

   - **Relationship between `percentage_laid_off` and funding stage**:
     ```sql
     SELECT stage, AVG(percentage_laid_off)
     FROM layoffs_staging2
     GROUP BY stage
     ORDER BY 2 DESC;
     ```

3. **Geographic Analysis**:
   - **Identifying countries or regions most affected by layoffs**:
     ```sql
     SELECT country, SUM(total_laid_off)
     FROM layoffs_staging2
     GROUP BY country
     ORDER BY 2 DESC;
     ```

4. **Visualization**:
   - **Rolling Total of Layoffs Per Month**:
     ```sql
     WITH Rolling_Total AS
     (
       SELECT SUBSTRING(`date`, 1, 7) AS `MONTH`, SUM(total_laid_off) AS total_off
       FROM layoffs_staging2
       WHERE SUBSTRING(`date`, 1, 7) IS NOT NULL
       GROUP BY `MONTH`
       ORDER BY 1 ASC
     )
     SELECT `MONTH`, total_off, SUM(total_off) OVER (ORDER BY `MONTH`) AS rolling_total
     FROM Rolling_Total;
     ```

5. **Additional Insights**:
   - **Companies with 100% layoffs**:
     ```sql
     SELECT *
     FROM layoffs_staging2
     WHERE percentage_laid_off = 1
     ORDER BY funds_raised_millions DESC;
     ```

   - **Companies with the most total layoffs**:
     ```sql
     SELECT company, SUM(total_laid_off)
     FROM layoffs_staging2
     GROUP BY company
     ORDER BY 2 DESC;
     ```

The SQL script used for cleaning is stored in `02_EDA.sql`.

---

## Project Workflow
1. **Data Cleaning** (Completed):
   - Cleaning SQL script: `01_Data_Cleaning.sql`

2. **Exploratory Data Analysis (EDA)**:
   - EDA SQL script: `02_EDA.sql`.

3. **Insights and Recommendations**:
   - Summarize key findings from EDA.
   - Provide actionable recommendations based on the data.

4. **Modeling (Optional)**:
   - Build predictive models to forecast layoffs or analyze factors contributing to layoffs.

---

## How to Use This Repository

1. **Data Cleaning**:
   - Refer to `01_Data_Cleaning.sql` for the SQL scripts used.
   - Ensure the cleaned dataset is ready for EDA.

2. **EDA**:
   - Refer to `02_EDA.sql` for the SQL scripts used.
   - Update the EDA section with visualizations and findings.

3. **Analysis Reports**:
   - Final insights and visualizations will be added to a separate report or notebook.

---

## Acknowledgments
- The dataset was curated from publicly available information on layoffs.
- Data cleaning and preparation scripts were authored to ensure data quality.

---

## Next Steps
1. Perform insights and recommendations based on EDA findings.
2. Populate the insights and recommendations section with actionable items.
3. Generate predictive models (if necessary).

---

