Cyclistic Bike-Share Analysis
Business Task
------------------------------------------------------------------------
Cyclistic is a bike-share company that wants to increase annual memberships.
The marketing team believes casual riders can be converted into annual members.

The goal of this project is to analyze rider behavior and answer:

How do annual members and casual riders use Cyclistic bikes differently?

The insights will be used to design a marketing strategy that converts casual riders into members.


Stakeholders
------------------------------------------------------------------------
Marketing Team → needs behavioral insights

Executive Team → wants revenue growth

Data Analyst (Me) → responsible for cleaning, analyzing, and visualizing data


Dataset
------------------------------------------------------------------------
Source: Cyclistic historical trip data (Divvy-like dataset)

Due to GitHub size limits, the full dataset is not included.
Instead, a cleaned sample dataset is provided:

data/sample_trips.csv


The sample preserves:

same schema

same distributions

same business logic

So results remain representative.

Tools Used
------------------------------------------------------------------------
R

tidyverse (dplyr, ggplot2, readr)

lubridate

RStudio


Project Structure
------------------------------------------------------------------------
Cyclistic/
│── data/
│    └── sample_trips.csv
│
│── outputs/
│    └── generated charts & summary tables
│
│── cyclistic_analysis.R
│── README.md


Data Cleaning Steps
------------------------------------------------------------------------
Converted date columns to proper datetime

Calculated ride duration

Removed negative and invalid rides

Extracted:

month

weekday

Removed missing values


Analysis Performed
------------------------------------------------------------------------
1) Average Ride Duration by Rider Type

Casual riders take significantly longer trips than members.

2) Ride Frequency by Day of Week

Members:

commute usage (weekdays)

Casual riders:

leisure usage (weekends)

3) Ride Frequency by Bike Type

Casual riders prefer electric bikes more often.

4) Monthly Usage Trends

Seasonal behavior detected — peak summer usage.


Key Insights
------------------------------------------------------------------------
Behavior	Casual Riders	Members
Trip Length	Longer	Shorter
Usage Time	Weekends	Weekdays
Purpose	Leisure	Commute
Bike Preference	Electric	Classic
💡 Business Recommendations
1) Weekend → Membership Campaign

Offer weekend riders a Monday-Friday commuter discount.

2) Electric Bike Upsell

Provide member discounts on electric bikes.

3) Seasonal Conversion

Target summer casual riders with limited-time membership offers.


How to Run
------------------------------------------------------------------------
In RStudio:

source("cyclistic_analysis.R")


The script will:

Load sample data

Clean data

Generate summary tables

Export CSV results

Generate visualizations

Outputs will appear in:

outputs/


Deliverables
------------------------------------------------------------------------
Cleaned dataset (sample)

R analysis script

Visualizations

Business recommendations


Author
------------------------------------------------------------------------
Ahmed
Google Data Analytics Capstone Project
