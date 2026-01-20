# Logistics Health Case Study: Brazilian E-Commerce
**Data Source:** (https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce)[Olist Brazilian E-Commerce Public Dataset] 

---

## Project Overview
This project addresses the complex logistics challenges of a large-scale marketplace operating in Brazil. The primary objective was to diagnose inefficiencies in the fulfillment cycle and provide data-driven insights to reduce issues caused by high lead times, as such issues may end up exacerbating issues around customer churn, increased logistics costs, and customer satsifaction.

## Analytical Objectives
* **Regional Benchmarking:** Identify high-friction states where delivery performance falls below the national average.
* **Process Decomposition:** Isolate the **Warehouse Phase** (Seller Processing) from the **Transit Phase** (Carrier Transit) to assign accountability.
* **Cost vs. Performance:** Evaluate the correlation between Freight Values and actual delivery speeds across different regions.

## KPIs Used
* **On-Time Delivery Percentage:** Calculates how much of the orders arrived early or on-time. _The higher the number, the better._
* **Average Lead Time:** Calculated the mean lead times (how long it takes between order purchases and customer delivery) nationally and by state. _The lower the number, the better_. 
* **Seller Processing Time:** The amount of time it took for the order to be handed over to the courier after an order has been processed by the seller. _The lower the number, the better_.
* **Carrier Processing Time:** The amount of time it took for the order to be delivered to the customer after having been received by the courier. _The lower the number, the better_.
* **Freight-to-Price Ratio:** Measures shipping cost efficiency by calculating the freight value as a ratio/percentage of a product's price. _The lower the number, the better._ 

---

## Technical Methodology

### Data Engineering & Modeling
* **ETL & Engineering:** Used **MySQL** for data cleaning and row-level calculations (e.g., calculating lead time intervals) before ingestion; implemented CTEs and window functions for better visualization performance and reusability. 
* **Visualization:** Used **Power BI** to visualize data and create a dashboard, utilizing some minor data cleaning for better readability.

###

### Dashboard Design
I designed a 3-page interactive Power BI dashboard focused on:
1.  **Executive Status:**
    ![Logistics Dashboard - main](Documents/Data Projects/Olist/images/executive_dashboard_main.png).
    High-level KPIs (On-Time Delivery %, Lead Time, Freight-to-Price Ratio).
2.  **Operational Diagnostics:** 
    ![A picture of my operational diagnostics page](Documents/Data Projects/Olist/images/operational_diagnostics.png)
     Deep dive into Seller vs. Carrier performance and examining the correlation between Shipping Price and Lead Time.
3.  **Reliability and Trends:** 
    ![A picture of my reliability and trends page](Documents/Data Projects/Olist/images/reliability_trends.png)
    Analysis of average lead time throughout quarters and months.
3.  **KPIs per state:** 
    ![A picture of my KPIs per state page](Documents/Data Projects/Olist/images/reliability_trends.png)
    Average KPIs per state.


---

## Analysis of Data
Based on the data trends, the following trends were analyzed:
* **National Performance:** During the period covered by the dataset, the network maintained a national average lead time of **12.5** days, with an on-time-delivery performance of **93.22%** and an average freight-to-price ratio of **30.84%**. While the on-time-delivery performance is within industry standards, both average lead times and average freight-to-price ratios **do not meet industry standards** of 2-3 days and 5-15% of order value respectively. It must be noted, however, that the data used in this set is at least 8 years old, and the industry standards and averages are contemporary in nature. If taking into account the time period in which the data was collected, however, one could assign the underperformance relative to international standards and averages to a less-developed e-commerce industry handling smaller order volumes doing business in a developing country where logistics infrastructure may be less robust compared to developed countries. At this point, systems and processes would still be somewhat emergent and may be hampered by bottlenecks not entirely within the company's control such as infrastructure investments, bureaucratic red tape, inefficient processes, and the like amongst logistics partners and government agencies. 
* **Regional Disparities:** As mexpected, states located in and around the Southeastern region (considered the economic and population hub of the country) tend to meet if not exceed KPIs. However same story cannot be said for other states and regions, most especially states in the geographically isolated **North region**, with Lead Times being as much as **134% higher**, OTD performance that is **5% lower**, and freight-to-price ratios that are "36% worse", all compared to the national average. (It may also be of interest to note that Roraima consistently performs the worst across all metrics measured). These figures may most likely be caused by the aforementioned geographic isolation, with much of the region's landmass occupied by the dense and thick Amazon rainforest, making logistics significantly harder to manage in the area, in addition to distance from Tier 1 logistics centers. Improvements in logistics in the region may also be hampered by lower economic activity and population count as noted by the relatively lower volume of orders in the region, going as low as 41 (again in Roraima). 
* **Last-Mile Transit As The Critical Constraint in Delivery Velocity** While seller processing times remain consistent throughout all state at around 3 days, **last-mile carrier transit varies highly by state** and is the **primary driver of lead time**. Much as with the previous point, these variances typically correspond to regions in terms of economic activity and population size, with Southeastern states maintaining relatively low processing times and Northern states maintaining very high numbers. It must be noted, though, that the last few months of data seem to indicate **decreasing last-mile carrier transit times,** although there are not enough data points to conclusively say that this is a long-term trend.
* **Freight Costs: Paying More for Longer Wait Times:** There is a positive correlation between Freight Value and Lead Times, meaning that **as freight costs increase, lead times tend to as well,**, especially when lead time pass the 15-20 day mark. As with previous points, variances typically align with regions, with the North spending more for slower deliveries and the Southeast paying less for faster lead times. 
* **Q1 and Q4: Slowest Times of the Year:** Average lead times are at its highest during the **first and fourth quarter** of the year. Q4 results are most likely due to the holiday season, while Q1 results may be due to Carnival, with businesses operating at reduced capacity or closing, sometimes for a full week. Additionally, Q1 is one of the wettest times of the year and is also back to school season, which may put more pressure on distribution networks. 
* **Lead Time Stability:** A frequency distribution of lead times suggests overall **stability and consistency**, most of which end up around the 5-15 day lead time period. 
---

## Strategic Recommendations
Based on the data trends, the following actions are proposed:
* **Improving Logistics Footprint:** Build more Regional Fullfillment Centers, especially in the North (or if not economically feasible yet, create a roadmap for establishment once certain regions and states hit particular thresholds). And to further improve service levels in more populated urban centers, establish Forward Stocking Locations.
* **Identify and Address Bottlenecks:**  Building out infrastructure is probably going to take a while, and may not even be feasible at the moment.  While the infrastructure is being built out, it would pay to have a comprehensive audit of the company's internal supply chain and operations systems, as internal processes may be playing a role in delays and long lead times. Once issues in the system have been identified, reengineer processes and systems for further optimization.
* **Optimize Carrier Dispatch:** Work with government agencies, logistics providers and last-mile couriers to address external issues that may be causing high lead times. For providers, lead times could be improved through strict implementation of service-level agreements and performance-based incentives.
* **Seasonal Capacity Planning:** Scale carrier capacity and adjust customer ETA expectations during identified peak Q1 and Q4 periods.

---

## How to Use
To interact with the analysis and view the dashboard:

1.  **Clone the Repository:**
    ```bash
    git clone [https://github.com/YourUsername/Logistics-Optimization-Case-Study.git](https://github.com/YourUsername/Logistics-Optimization-Case-Study.git)
    ```
2.  **Open the Dashboard:** * Ensure you have [Power BI Desktop](https://powerbi.microsoft.com/desktop/) installed.
    * Open the `.pbix` file located in the `/dashboard` folder.
3.  **Database (Optional):** * The raw cleaning scripts are located in the `/sql` folder for those who wish to see the data transformation logic.

