# World Layoffs Data Analysis

## Project Overview
This project analyzes global layoffs across various industries and companies. The data highlights the impact of layoffs on employees, companies, and industries. The main goals are to:

- Identify trends in layoffs across time, regions, and industries.
- Quantify the severity of layoffs and understand their correlation with factors such as funding stage and funds raised.
- Provide actionable insights through visualizations and statistical analyses.

The project will proceed through the following stages:

1. **Data Cleaning** (Completed)
2. **Exploratory Data Analysis (EDA)** (Upcoming)
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
**Status**: To be completed.

The following analyses will be conducted during the EDA phase:

1. **Univariate Analysis**:
   - Distribution of layoffs by industry, location, and funding stage.
   - Trends in layoffs over time.

2. **Bivariate and Multivariate Analysis**:
   - Correlation between `funds_raised_millions` and `total_laid_off`.
   - Relationship between `percentage_laid_off` and funding stage.

3. **Geographic Analysis**:
   - Identifying countries or regions most affected by layoffs.

4. **Visualization**:
   - Interactive plots to show trends and insights (e.g., time series, bar charts, heatmaps).

**Placeholders**: Once the EDA is completed, results and insights will populate this section.

---

## Project Workflow
1. **Data Cleaning** (Completed):
   - Cleaning SQL script: `01_Data_Cleaning.sql`

2. **Exploratory Data Analysis (EDA)**:
   - Utilize Python libraries like Pandas, Matplotlib, and Seaborn for analysis and visualization.

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
   - Use the `layoffs_staging2.csv` file for analysis.
   - Update the EDA section with visualizations and findings.

3. **Analysis Reports**:
   - Final insights and visualizations will be added to a separate report or notebook.

---

## Acknowledgments
- The dataset was curated from publicly available information on layoffs.
- Data cleaning and preparation scripts were authored to ensure data quality.

---

## Next Steps
1. Perform exploratory data analysis.
2. Populate the EDA section with findings and visualizations.
3. Generate insights and provide actionable recommendations.
```

