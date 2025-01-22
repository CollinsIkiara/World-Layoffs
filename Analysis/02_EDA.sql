-- Exploratory Data Analysis

SELECT *
FROM layoffs_staging2;


SELECT MAX(total_laid_off), MAX(percentage_laid_off)
FROM layoffs_staging2;

-- Which companies had 1 which is basically 100 percent of they company laid off
SELECT *
FROM layoffs_staging2
WHERE percentage_laid_off = 1
ORDER BY funds_raised_millions DESC; -- these are mostly startups it looks like who all went out of business during this time

-- Companies with the most Total Layoffs
SELECT company, SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY company
ORDER BY 2 DESC; 

SELECT MIN(`date`), MAX(`date`)
FROM layoffs_staging2; -- date ranges, reveals a 3-year period of layoffs


SELECT industry, SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY industry
ORDER BY 2 DESC; -- industries with the highest layoffs

SELECT *
FROM layoffs_staging2;

SELECT country, SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY country
ORDER BY 2 DESC; -- countries with the highest layoffs

SELECT YEAR(`date`), SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY YEAR(`date`)
ORDER BY 1 DESC; -- layoffs per year


SELECT stage, SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY stage
ORDER BY 2 DESC; -- most layoffs based on stage of funding


SELECT company, AVG(percentage_laid_off)
FROM layoffs_staging2
GROUP BY company
ORDER BY 2 DESC;


-- TOUGHER QUERIES

-- Rolling Total of Layoffs Per Month
SELECT SUBSTRING(`date`,1,7) AS `MONTH`, SUM(total_laid_off)
FROM layoffs_staging2
WHERE SUBSTRING(`date`,1,7) IS NOT NULL
GROUP BY `MONTH`
ORDER BY 1 ASC; 


-- now use it in a CTE so we can query off of it
WITH Rolling_Total AS
(
SELECT SUBSTRING(`date`,1,7) AS `MONTH`, SUM(total_laid_off) AS total_off
FROM layoffs_staging2
WHERE SUBSTRING(`date`,1,7) IS NOT NULL
GROUP BY `MONTH`
ORDER BY 1 ASC
)
SELECT `MONTH`, total_off
,SUM(total_off) OVER(ORDER BY `MONTH`) AS rolling_total
FROM Rolling_Total; 



-- Earlier we looked at Companies with the most Layoffs. Now let's look at that per year. It's a little more difficult.
-- I want to look at 

-- Total layoffs for each company per year
SELECT company, YEAR(`date`), SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY company, YEAR(`date`)
ORDER BY 3 DESC; 


-- Top 5 companies in layoffs per year, using 2 CTEs the first one being the query above
WITH Company_Year (company, years, total_laid_off) AS
(
SELECT company, YEAR(`date`), SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY company, YEAR(`date`) -- 1st CTE
), Company_Year_Rank AS 
(
SELECT *, DENSE_RANK() OVER(PARTITION BY years ORDER BY total_laid_off DESC) AS Ranking
FROM Company_Year
WHERE years IS NOT NULL
) -- 2nd CTE
SELECT *
FROM Company_Year_Rank
WHERE Ranking <= 5; 