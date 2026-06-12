# UrbanCart Data Analytics Project

> **Executive Summary:** UrbanCart is an online retail company that collects customer, product, order, and payment transaction data. This project analyzes UrbanCart's business data using PostgreSQL SQL to understand sales performance, customer behavior, product performance, inventory status, and payment trends. The objective of this analysis is to convert raw transactional data into meaningful business insights that help management make data-driven decisions.

---

## 🎯 Project Objectives
Here is the core focus of the analysis:
* ***Sales Performance:*** Analyzing overall revenue trajectories.
* ***Customer Behavior:*** Understanding target user trends and purchasing cycles.
* ***Product Intelligence:*** Identifying high-velocity and top-performing products.
* ***Risk Mitigation:*** Analyzing cancellation trends and supply factors.
* ***Strategic Growth:*** Generating core business insights for stakeholders.

---

## 🗄️ Database Schema & Architecture
The structural design employs an Entity-Relationship (ER) Diagram to explicitly map out the direct relationships and relational joins between core fact and dimension tables.

---

## ❓ Business Questions Addressed (Q1–Q25)

| Category | Focus Metrics |
| :--- | :--- |
| **🛍️ Order Analysis** | • Total number of orders<br>• Monthly order trends<br>• Cancellation analysis<br>• Customer order activity |
| **📈 Sales & Product Analysis** | • Total revenue calculation<br>• City-wise sales performance<br>• Category revenue contribution<br>• Top revenue generating products<br>• Average order value<br>• Basket size analysis<br>• Inventory risk analysis |
| **👥 Customer Analysis** | • Gmail customer percentage<br>• Top revenue generating customers<br>• Customer purchasing behavior<br>• Gender based purchasing pattern |
| **💳 Payment Analysis** | • Most used payment methods<br>• Payment method vs order status<br>• City payment preferences<br>• Payment behavior analysis |
| **🔗 Product Relationship** | • Frequently purchased product pairs<br>• Product bundle revenue analysis |

---

## 🛠️ Analysis Performed
The following deep-dives were executed inside the PostgreSQL environment:
* **Revenue analysis:** Evaluating business sales volume and channel value.
* **Customer segmentation analysis:** Isolating high-value user clusters.
* **Product performance analysis:** Auditing individual product metrics.
* **Inventory analysis:** Pinpointing low safety-stock thresholds.
* **Payment behavior analysis:** Mapping gateway success rates and cart correlations.
* **Daily business reporting:** Constructing daily system updates.

---

## 💡 Key Insights & Findings

### 💰 Sales Insights
* Certain product categories contribute a major portion of total revenue.
* High performing products generate significant sales volume.

### 👥 Customer Insights
* A small group of customers contributes a large percentage of revenue.
* Customer purchasing patterns vary based on location and category preference.

### 📦 Product Insights
* Some products have high sales volume but low inventory availability.
* Frequently purchased products can be promoted as bundles.

### 💳 Payment Insights
* Customers show different payment preferences by location.
* Certain payment methods are associated with higher order values.

---

## 🚀 Business Recommendations

1. **Inventory Management**
   > Increase stock availability for high demand products to reduce stock-out risk.
2. **Marketing Strategy**
   > Create targeted promotions for high value customers.
3. **Product Bundling**
   > Promote frequently purchased product combinations to increase sales.
4. **Customer Retention**
   > Develop loyalty programs for repeat customers.
5. **Payment Optimization**
   > Improve preferred payment methods based on customer behavior.

---

## 💻 Tech Stack
* **Database Engine:** PostgreSQL
* **Query Language:** SQL
* **visualization:** Excel 
* **Hosting Platform:** GitHub
