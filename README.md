COVID-19 Data Exploration in SQL

This project is a deep dive into the global COVID-19 data provided by Our World in Data. The aim was to take a massive, messy dataset and use SQL to extract specific trends that matter like the actual risk of mortality and how fast vaccinations were rolling out in different parts of the world.

I wrote these queries to clean, transform, and prepare the data for later use in Tableau.

Data Sources
I used two main tables for this analysis:
  1.	CovidDeaths: This handles the case numbers and mortality figures.
  2.	CovidVaccinations: This tracks the testing and immunisation metrics. Timeframe: January 2020 – Early 2021

The SQL Toolkit

I used a variety of techniques to get the results I needed, including:

•	Joins: Linking the deaths and vaccinations tables by date and location.

•	Window Functions: Specifically using PARTITION BY to build rolling totals for vaccinations.

•	CTEs and Temp Tables: Essential for breaking down complex calculations into manageable steps.

•	Views: I saved the final queries as views so they could be pulled directly into visualisation software.

•	Data Typing: Utilised CAST and CONVERT to make sure math operations worked on the raw string data.

What I was looking for
  1. Mortality Probability I calculated the death percentage by comparing total deaths to total cases. This shows the likelihood of dying if you contracted COVID-19 in a specific country at a specific point in time.
  2. Infection Rates vs Population I wanted to see what percentage of the population caught the virus. Comparing total cases to the total population helped highlight which countries were truly being hit the hardest.
  3. Regional Trends I filtered the data by continent to get a bird's-eye view of the impact. This made it easier to compare how different global regions were coping compared to individual countries.
  4. Vaccination Progress I built a rolling count of people vaccinated. By partitioning this by location, I could track the daily progress of the rollout and see what percentage of the population was protected as time went   on.







COVID-19 DATA EXPLORATION WITH SQL

THIS REPOSITORY CONTAINS AN END-TO-END DATA EXPLORATION PROJECT ON A COVID-19 DATASET, FOCUSED ON UTILISING SQL FOR DATA CLEANING, MANIPULATION, AND ANALYSIS. THIS PROJECT IS A FOUNDATIONAL PIECE IN MY DATA ANALYST PORTFOLIO, DEMONSTRATING KEY SKILLS IN PREPARING AND QUERYING DATA FOR ACTIONABLE INSIGHTS AND SUBSEQUENT VISUALISATION. FOR AN INTERACTIVE DEMO AND FULL PROJECT DETAILS, VISIT THE LIVE PROJECT DEMO.


KEY SKILLS AND TECHNIQUES
DATA CLEANING & MANIPULATION: PREPARING RAW DATA BY HANDLING NULL VALUES, CASTING DATA TYPES, AND USING IF STATEMENTS TO CATEGORISE DATA.
SQL QUERYING: USING SELECT, WHERE, GROUP BY, AND ORDER BY CLAUSES TO EXPLORE AND ANALYSE DATA.

ADVANCED SQL CONCEPTS:
JOINS: MERGING MULTIPLE DATASETS TO CREATE A COMPREHENSIVE VIEW.
WINDOW FUNCTIONS: CREATING ROLLING COUNTS FOR CUMULATIVE ANALYSIS.
COMMON TABLE EXPRESSIONS (CTES): SIMPLIFYING COMPLEX QUERIES FOR READABILITY AND EFFICIENCY.
TEMPORARY TABLES & VIEWS: STORING AND REUSING QUERY RESULTS FOR FURTHER ANALYSIS OR VISUALISATION.
DATA-DRIVEN INSIGHTS: CALCULATING KEY METRICS SUCH AS INFECTION AND DEATH PERCENTAGES AND IDENTIFYING TOTAL CASES AND DEATHS BY LOCATION.

TOOLS USED
SQL SERVER: FOR QUERYING AND DATA MANIPULATION.
MICROSOFT EXCEL: FOR INITIAL DATA REFORMATTING AND PREPARATION.

PROJECT STATUS
THIS PROJECT IS A COMPLETED PORTFOLIO PIECE. THE SQL SCRIPT IS INCLUDED IN THIS REPOSITORY.

