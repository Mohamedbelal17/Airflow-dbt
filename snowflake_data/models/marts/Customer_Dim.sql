SELECT
    customer_id AS customer_key,
    first_name || ' ' || last_name AS full_name,
    age,
    gender,
    address,
    city,
    contact_number,
    email,
    account_type
FROM {{ source("raw_data", "COMPREHENSIVE_BANKING_DATABASE") }}
