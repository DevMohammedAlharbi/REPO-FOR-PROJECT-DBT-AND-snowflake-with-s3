{{ config( materialized='incremental' , unique_key='HOST_ID' ) }}


SELECT
    HOST_ID,
    Replace(HOST_NAME ,' ' , '-') AS HOST_NAME,
    HOST_SINCE,
    IS_SUPERHOST,
    CASE
       WHEN RESPONSE_RATE > 95 then 'Very High'
       WHEN RESPONSE_RATE > 80 then 'GOOD'
       WHEN RESPONSE_RATE > 60 then 'FAIR'
       ELSE 'POOR'
    END AS RESPONSE_RATE_QUALITY,
    CREATED_AT
from {{ ref("bronze_hosts")}} 
