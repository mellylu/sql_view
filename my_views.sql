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
    
SELECT * FROM ALL_WORKERS_ELAPSED
