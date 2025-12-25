SELECT
    ROW_NUMBER() OVER (ORDER BY date_value) AS date_key,
    date_value,
    YEAR(date_value) AS year,
    QUARTER(date_value) AS quarter,
    MONTH(date_value) AS month,
    DAY(date_value) AS day
FROM (
    SELECT DISTINCT date_value
    FROM (
        SELECT TO_DATE(DATE_OF_ACCOUNT_OPENING  , 'MM/DD/YYYY') AS date_value
        FROM {{ source("raw_data", "COMPREHENSIVE_BANKING_DATABASE") }}

        UNION

        SELECT TO_DATE(LAST_TRANSACTION_DATE , 'MM/DD/YYYY') AS date_value
        FROM {{ source("raw_data", "COMPREHENSIVE_BANKING_DATABASE") }}

        UNION

        SELECT TO_DATE(TRANSACTION_DATE , 'MM/DD/YYYY') AS date_value
        FROM {{ source("raw_data", "COMPREHENSIVE_BANKING_DATABASE") }}

        UNION

        SELECT TO_DATE(APPROVAL_REJECTION_DATE , 'MM/DD/YYYY') AS date_value
        FROM {{ source("raw_data", "COMPREHENSIVE_BANKING_DATABASE") }}

        UNION

        SELECT TO_DATE(PAYMENT_DUE_DATE , 'MM/DD/YYYY') AS date_value
        FROM {{ source("raw_data", "COMPREHENSIVE_BANKING_DATABASE") }}

        UNION

        SELECT TO_DATE(LAST_CREDIT_CARD_PAYMENT_DATE , 'MM/DD/YYYY') AS date_value
        FROM {{ source("raw_data", "COMPREHENSIVE_BANKING_DATABASE") }}

        UNION

        SELECT TO_DATE(FEEDBACK_DATE , 'MM/DD/YYYY') AS date_value
        FROM {{ source("raw_data", "COMPREHENSIVE_BANKING_DATABASE") }}

        UNION

        SELECT TO_DATE(RESOLUTION_DATE) AS date_value
        FROM {{ source("raw_data", "COMPREHENSIVE_BANKING_DATABASE") }}
    )
) AS unique_dates
ORDER BY date_value
