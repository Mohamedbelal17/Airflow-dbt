
select 
row_number() over (order by c.customer_key) as account_key ,
c.customer_key ,
l.loan_key ,
d.date_key ,
f.account_balance ,
f.loan_amount ,
from {{ source("raw_data" , "COMPREHENSIVE_BANKING_DATABASE") }} as f
join {{ ref("Customer_Dim") }} as c
    on f.customer_id = c.customer_key
join {{ ref("loan_Dim") }} as l
    on f.loan_id = l.loan_key
join {{ ref("Date_Dim") }} as d
    on TO_DATE(f.APPROVAL_REJECTION_DATE , 'MM/DD/YYYY') = d.date_value