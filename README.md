## README: Fufu Republic Inventory and Stock Management Dimensional Model

### Overview
This project presents a **dimensional model** for addressing the **Inventory and Stock Management** challenges faced by Fufu Republic, a popular restaurant chain in Nigeria. The solution is designed to optimize inventory levels, track stock movements, and improve customer satisfaction by ensuring popular items are always available across multiple branches. The dimensional model also supports analysis of sales patterns, supplier performance, and stock trends.

---

### Business Challenges Addressed

1. **Inventory Management**: 
   - Tracking stock levels across branches.
   - Identifying stock shortages and optimizing restocking schedules to reduce waste and prevent stockouts.
   - Monitoring how sales impact inventory and adjusting stock orders accordingly.

2. **Sales Demand Analysis**:
   - Understanding customer demand at each branch and for each menu item.
   - Analyzing trends based on sales data to forecast future stock needs and optimize inventory.

3. **Supplier Management**:
   - Tracking supplier performance in restocking inventory.
   - Linking stock transactions to suppliers to evaluate which suppliers contribute to efficient stock management.

4. **Customer Satisfaction**:
   - Preventing stockouts of popular items, ensuring a better customer experience across all branches.

---

### Business Process: **Inventory and Stock Management**

The core business process in this solution is **Inventory and Stock Management**, which focuses on recording stock transactions (restocks, sales, and adjustments) and maintaining optimal stock levels at each branch. This model provides Fufu Republic with insights to make data-driven decisions related to inventory replenishment, waste reduction, and stock allocation.

---

### Business Questions:
The dimensional model for Inventory and Stock Management aims to answer the following key business questions:

1. **What are the current stock levels for each menu item at each branch?**
2. **Which menu items experience frequent stock shortages across branches?**
3. **How frequently is inventory restocked, and which items are restocked most often?**
4. **Which suppliers are responsible for the majority of the restocked items, and how reliable are they?**
5. **How do sales and customer demand impact stock levels across different branches and over time?**
6. **What is the total value of stock transactions (sales and restocks) for each branch?**

---

### Grain:
The **grain** of the fact table is **at the level of individual stock transactions**, where each row represents a single stock movement (e.g., a restock or sale) for a specific menu item at a particular branch.

---

### Dimensional Model

The dimensional model is designed using **Star Schema** architecture, where the **Fact Table** captures stock transaction data, and the **Dimension Tables** provide descriptive information to analyze the transactions.

#### Fact Table
The **Fact Table** (`Inventory_Transactions_Fact`) holds the quantitative data representing each stock transaction, such as the number of items added or removed from inventory, the branch where the transaction occurred, and the type of transaction (e.g., sale, restock).

#### Dimension Tables
The **Dimension Tables** provide context for the facts, allowing for in-depth analysis. Each dimension describes an aspect of the stock transaction:
- **Branch Dimension**: Represents each branch where inventory is managed.
- **Menu Item Dimension**: Describes the menu items being tracked in inventory.
- **Transaction Type Dimension**: Identifies whether the transaction was a sale, restock, or adjustment.
- **Supplier Dimension**: Represents the suppliers who provide stock for restocks.
- **Date Dimension**: Tracks when stock changes occur for time-based analysis.

---

### Data Model Design

#### Fact Table: `Inventory_Transactions_Fact`

| Column             | Data Type   | Description                                       |
|--------------------|-------------|---------------------------------------------------|
| transaction_id      | INT         | Primary key                                       |
| branch_id           | INT         | Foreign key to `Branch_Dimension`                 |
| menu_item_id        | INT         | Foreign key to `Menu_Item_Dimension`              |
| transaction_type_id | INT         | Foreign key to `Transaction_Type_Dimension`       |
| supplier_id         | INT         | Foreign key to `Supplier_Dimension` (optional)    |
| date_id             | INT         | Foreign key to `Date_Dimension`                   |
| quantity            | INT         | Number of items added or subtracted               |
| unit_price          | NUMERIC     | Unit price at the time of transaction             |
| total_amount        | NUMERIC     | Total value of the transaction                    |

---

#### Dimension Tables

##### 1. `Branch_Dimension`

| Column      | Data Type | Description                  |
|-------------|-----------|------------------------------|
| branch_id   | INT       | Primary key                  |
| branch_name | VARCHAR   | Name of the branch            |
| location    | VARCHAR   | Branch location               |

##### 2. `Menu_Item_Dimension`

| Column        | Data Type | Description                 |
|---------------|-----------|-----------------------------|
| menu_item_id  | INT       | Primary key                 |
| name          | VARCHAR   | Name of the menu item        |
| description   | TEXT      | Description of the item      |
| category      | VARCHAR   | Category of the menu item    |
| price         | NUMERIC   | Unit price of the item       |

##### 3. `Transaction_Type_Dimension`

| Column             | Data Type | Description                       |
|--------------------|-----------|-----------------------------------|
| transaction_type_id | INT       | Primary key                       |
| transaction_type    | VARCHAR   | Type of transaction (sale, restock, adjustment) |

##### 4. `Supplier_Dimension`

| Column        | Data Type | Description                 |
|---------------|-----------|-----------------------------|
| supplier_id   | INT       | Primary key                 |
| supplier_name | VARCHAR   | Supplier’s name             |
| contact_info  | VARCHAR   | Supplier’s contact details  |

##### 5. `Date_Dimension`

| Column      | Data Type | Description                 |
|-------------|-----------|-----------------------------|
| date_id     | INT       | Primary key                 |
| day         | INT       | Day of the month            |
| month       | INT       | Month of the year           |
| quarter     | INT       | Quarter of the year         |
| year        | INT       | Year                        |
| day_of_week | VARCHAR   | Day of the week             |


### How to Use This Model

1. **Analyze Stock Levels**:
   - Use the model to track stock levels across all branches and menu items.
   - Identify items running low on stock and prevent stockouts.

2. **Optimize Restocking**:
   - Analyze restocking patterns to ensure popular items are restocked regularly.
   - Use supplier data to evaluate which suppliers deliver inventory in a timely and efficient manner.

3. **Customer Demand Insights**:
   - Use sales data to understand how customer demand impacts inventory and optimize stock ordering based on historical trends.

---

### Conclusion

This **Inventory and Stock Management Dimensional Model** offers a comprehensive solution to the inventory challenges faced by Fufu Republic. It enables the business to track inventory in real-time, optimize restocking processes, and use data-driven insights to ensure stock availability, minimize waste, and improve customer satisfaction. The model is scalable and can be easily adapted for future enhancements.
