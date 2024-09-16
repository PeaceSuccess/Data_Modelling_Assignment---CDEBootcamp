### How to Use This Model

1. **Analyze Stock Levels**:
   - Query current stock levels for each branch and menu item.
   - Identify items that frequently go out of stock.

2. **Optimize Restocking**:
   - Analyze supplier performance by tracking restock frequency.
   - Ensure popular items are restocked based on historical trends.

3. **Sales Impact on Inventory**:
   - Track how sales reduce inventory and adjust stock orders accordingly.

---

### Insight queries

1. **Current Stock Levels**:
   
   SELECT branch_name, name AS menu_item, SUM(quantity) AS current_stock
   FROM Inventory_Transactions_Fact
   JOIN Branch_Dimension ON Inventory_Transactions_Fact.branch_id = Branch_Dimension.branch_id
   JOIN Menu_Item_Dimension ON Inventory_Transactions_Fact.menu_item_id = Menu_Item_Dimension.menu_item_id
   WHERE transaction_type = 'restock' OR transaction_type = 'sale'
   GROUP BY branch_name, name;
   

2. **Top Suppliers by Restocking Amount**:
   
   SELECT supplier_name, SUM(quantity) AS total_restocked
   FROM Inventory_Transactions_Fact
   JOIN Supplier_Dimension ON Inventory_Transactions_Fact.supplier_id = Supplier_Dimension.supplier_id
   WHERE transaction_type = 'restock'
   GROUP BY supplier_name;
   

3. **Sales Impact on Inventory**:
   
   SELECT name AS menu_item, SUM(quantity) AS total_sales
   FROM Inventory_Transactions_Fact
   JOIN Menu_Item_Dimension ON Inventory_Transactions_Fact.menu_item_id = Menu_Item_Dimension.menu_item_id
   WHERE transaction_type = 'sale'
   GROUP BY name
   ORDER BY total_sales DESC;
   
