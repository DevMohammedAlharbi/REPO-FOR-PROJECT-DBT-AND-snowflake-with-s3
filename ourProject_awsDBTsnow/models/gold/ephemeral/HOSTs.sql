{{ config( materialized='ephemeral' ) }}


WITH EP_HOST AS 
(
   SELECT 
      HOST_ID , HOST_NAME , HOST_SINCE , IS_SUPERHOST , RESPONSE_RATE_QUALITY , HOST_CREATED_AT
   FROM 
      {{ ref('obt') }}  
)

-- PASS THE QUERY
SELECT * FROM EP_HOST