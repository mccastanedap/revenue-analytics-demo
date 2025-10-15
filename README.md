MIT License

Copyright (c) [2025] [Melissa Castañeda]

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.


# Revenue Analytics Demo — SaaS KPIs & Forecasting

This project simulates a SaaS environment and demonstrates how to compute **RevOps KPIs** (MRR, ARR, Churn Rate, NRR) using Python, SQL (dbt-style), and Power BI.  
It’s designed as a learning portfolio aligned with roles like **Senior Data Analyst at Twilio**.

## 📂 Project Structure

revenue-analytics-demo/
├── data/
│ ├── customers.csv
│ └── revenue.csv
├── models/
│ └── fct_revenue.sql
├── notebooks/
│ └── 01_revenue_kpis.ipynb
├── outputs/ # generated CSVs & charts
├── LICENSE
└── README.md



## 🚀 Quick Start
1. Clone or download the repo.  
2. Open `notebooks/01_revenue_kpis.ipynb` in Jupyter or VS Code.  
3. Run all cells to generate:
   - KPI tables → `outputs/*.csv`
   - Charts → `outputs/*.png`

## 📊 KPIs Implemented
- **MRR:** Monthly Recurring Revenue  
- **ARR:** Annual Recurring Revenue (`MRR * 12`)  
- **Churn Rate:** MRR lost to churn ÷ prior-month MRR  
- **NRR:** Current MRR of existing customers ÷ previous MRR  

## 💡 Insights Example
- Enterprise customers drive the highest ARR with the lowest churn.
- NRR averages **>105 %**, showing strong expansion revenue.
- SMB segment shows most churn volatility — an opportunity for retention programs.

## 🧠 Next Steps
- Add forecasting notebook (Prophet / ARIMA).  
- Build a Power BI dashboard and embed screenshots.  
- Extend with CAC / LTV and pipeline conversion analysis.

