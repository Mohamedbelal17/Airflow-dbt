

SELECT
    loan_id AS loan_key,
    loan_type,
    loan_term,
    loan_status,
    INTEREST_RATE
FROM {{ source("raw_data", "COMPREHENSIVE_BANKING_DATABASE") }}