-- Day 15__(Use of full outer joins)
How many sales transactions occurred in each store, including those stores with no sales?
SQL Query:
SELECT stores.store_name, COUNT(sales.transaction_id) AS total_sales
     FROM stores
     FULL OUTER JOIN sales ON stores.store_id = sales.store_id
     GROUP BY stores.store_name;
The query will provide a list of store names along with the total number of sales transactions in each store, including stores with zero sales.

Which transactions were successfully matched with customer information, and which ones were unmatched?

SELECT transactions.transaction_id, customers.customer_name
     FROM transactions
     FULL OUTER JOIN customers ON transactions.customer_id = customers.customer_id
     WHERE transactions.transaction_id IS NOT NULL AND customers.customer_name IS NOT NULL;
The query will retrieve the transaction IDs along with the corresponding customer names for successfully matched transactions. It will exclude unmatched transactions and customers.

Question: How many products were manufactured by each company, including companies with no products?

SELECT companies.company_name, COUNT(products.product_id) AS total_products
     FROM companies
     FULL OUTER JOIN products ON companies.company_id = products.company_id
     GROUP BY companies.company_name;
The query will provide a list of company names along with the total number of products manufactured by each company, including companies with zero products.
By using the SQL Full Outer Join and these carefully crafted questions, we can gain valuable insights and make data-driven decisions in various domains. 📊