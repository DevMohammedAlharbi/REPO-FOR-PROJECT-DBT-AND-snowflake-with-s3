{#   {% set incremental_flag = 1 %}             #}      {# Controls run mode : 0,2,3 = Full refresh ||  1 = Incremental load #}
{#   {% set incremental_colu = 'CREATED_AT' %}  #}      {# Specifies the timestamp column used for filtering new records #}

{{ config ( materialized='incremental' )  }}


select * from {{ source('staging' , 'hosts')}}


{% if is_incremental() %}
  WHERE CREATED_AT > ( SELECT COALESCE( MAX( CREATED_AT ) , '1900-01-01' ) FROM {{ this }} )
{% endif %}  
