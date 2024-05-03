CREATE OR REPLACE VIEW ALL_WORKERS AS
SELECT
    LAST_NAME as lastname,
    FIRST_NAME as firstname,
    AGE,
    first_day AS start_date
FROM
    WORKERS_FACTORY_1
UNION ALL
SELECT
    LAST_NAME as lastname,
    FIRST_NAME as firstname,
    NULL as AGE,
    start_date AS start_date
FROM
    WORKERS_FACTORY_2
ORDER BY start_date DESC;


CREATE OR REPLACE VIEW ALL_WORKERS_ELAPSED AS
SELECT
    lastname,
    firstname,
    age,
    start_date,
    TRUNC(SYSDATE) - start_date AS days_elapsed
FROM
    ALL_WORKERS;
    

CREATE OR REPLACE VIEW BEST_SUPPLIERS AS
SELECT
    s.name AS supplier_name,
    SUM(sb.quantity) AS total_quantity
FROM
    SUPPLIERS s
INNER JOIN
    SUPPLIERS_BRING_TO_FACTORY_1 sb ON s.supplier_id = sb.supplier_id
GROUP BY
    s.name
HAVING
    SUM(sb.quantity) > 1000
ORDER BY
    total_quantity DESC;
