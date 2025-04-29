# LaLiga 2023/24 Analytics Project

This project analyzes the 2023/24 La Liga season data using SQL Server, SSIS, and Power BI.

## Project Overview
- Built a scalable ETL pipeline using SSIS to load match and team performance data.
- Modeled the database in SQL Server with proper relationships (Teams, Matches, Performance Metrics).
- Created dynamic and interactive Power BI dashboards to visualize team performances, discipline analysis, and match outcomes.
- Calculated custom KPIs like Average Goals per Match, Clean Sheets %, Discipline Score using DAX.

## Tools Used
- SQL Server Management Studio (SSMS)
- SQL Server Integration Services (SSIS)
- Microsoft Power BI Desktop
- GitHub for version control

## Folder Structure
- `/Data/` → Raw CSV files
- `/PBIX/` → Power BI dashboard file
- `/SQL/` → SQL Scripts and DAX scripts
- `/Documentation/` → Project ReadMe and notes

## How to Run
1. Clone the repository.
2. Load CSVs into SQL Server.
3. Open Power BI Desktop ➔ Load the PBIX file.
4. Refresh data connections if needed.
