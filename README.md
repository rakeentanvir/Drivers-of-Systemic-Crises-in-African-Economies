# Drivers of Systemic Crises in African Countries

## Primary Files

Final.Rmd contains the main analysis code and its output is Final.html

Variables Definitions.docx lists and defines the studied variables

Abstract.Rmd contains our initial project overview and its outputs are Abstract.html and Abstract.pdf

Discarded.Rmd contains ideas that were conceived but excluded from the analysis

## Project overview and data collection

This is an exploratory observational study to understand what factors drive systemic crises (financial instability) in 13 African countries. 

The primary data was obtained as a mostly clean data set from Kaggle: https://www.kaggle.com/chirin/africa-economic-banking-and-systemic-crisis-data. 

From Kaggle: "The dataset is a derivative of Reinhart et al's Global Crises dataset. It was downloaded from: https://www.hbs.edu/behavioral-finance-and-financial-stability/data/Pages/global.aspx Non-African countries were filtered out from the dataset. And, variables containing notes or sparse data were removed. Years with no data were also filtered out...The dataset specifically focuses on the Banking, Debt, Financial, Inflation and Systemic Crises that occurred, from 1860 to 2014, in 13 African countries, including: Algeria, Angola, Central African Republic, Ivory Coast, Egypt, Kenya, Mauritius, Morocco, Nigeria, South Africa, Tunisia, Zambia and Zimbabwe."

Additional Commodity Import & Export Price Index data was web scraped and added to the primary data set: https://data.imf.org/?sk=2CDDCCB8-0B59-43E9-B6A0-59210D5605D2&sId=1390030341854. From Commodity of Terms of Trade: Commodity Import/Export Price Index, Individual Commodities Weighted by Ratio of Imports to GDP Historical, Annual (1965-present), Fixed Weights, Index(2012=100).

## Objectives

We seek to answer the following questions:

1. What patterns and trends are associated with systemic crises?

2. What economic factors drive systemic crises? Which have the most (or least) effect? How do these differ by country?

3. How do non-economic factors, such as independence from colonial rule, affect systemic crises?

## Methods

The analysis and presentation will be created using RMarkdown as a powerful communication tool. We make use of several data types including various vectors, matrices, lists, data frames, and tibbles. Web scraping makes use of strings and regular expressions. Data transformations are done using dplyr and visualizations are done using ggplot2. Our regression analysis makes use of techniques from model fitting/optimization, functions of functions, and bootstrapping confidence intervals for regression coefficients. We expect to conduct a logistic regression given that our outcome of interest is a binary variable indicating the presence of a systemic crisis for a particular year and country. 

## Analysis

Data collection and preparation - import and transform into tidy data, web scrape commodity import and export price index, transform data

Exploratory data analysis - correlation tests and economic interpretations

Data visualizations - correlation matrix and dependency on time and independence from colonial rule

Preliminary model investigation - simple logistic regression and boostrapped confidence intervals, multipe logistic regression and optimization of cutoff parameter
