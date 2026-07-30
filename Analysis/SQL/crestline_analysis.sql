-- Crestline Infrastructure Group
-- Operational Data Analysis Project
-- Author: Enock Amankwaa
-- Portfolio SQL Queries

/* Query 1: View all delivery records */
SELECT *
FROM delivery_performance;

/* Query 2: Identify duplicate deliveries */
SELECT
    delivery_id,
    COUNT(*) AS duplicate_count
FROM delivery_performance
GROUP BY delivery_id
HAVING COUNT(*) > 1;

/* Query 3: Count projects by status */
SELECT
    project_status,
    COUNT(*) AS total_projects
FROM delivery_performance
GROUP BY project_status;

/* Query 4: Average delivery performance */
SELECT
    AVG(on_time_delivery) AS average_delivery_rate
FROM delivery_performance;

/* Query 5: Supplier invoice reconciliation */
SELECT
    supplier_name,
    invoice_number,
    invoice_total,
    line_item_sum,
    (invoice_total - line_item_sum) AS variance
FROM supplier_invoices
WHERE invoice_total <> line_item_sum;

/* Query 6: Procurement spend by supplier */
SELECT
    supplier_name,
    SUM(invoice_total) AS total_spend
FROM supplier_invoices
GROUP BY supplier_name
ORDER BY total_spend DESC;

/* Query 7: Active projects */
SELECT
    project_name,
    project_status,
    project_manager
FROM delivery_performance
WHERE project_status = 'Active';
