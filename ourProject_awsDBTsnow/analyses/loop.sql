{% set columns = ['BOOKING_ID' , 'LISTING_ID' , 'BOOKING_DATE'] %}
{% set columnsForExmp2 = ['HOST_ID' , 'HOST_NAME'] %}


{#

-------------------------------------------------- EX 1

select 
{% for col in columns %}
    {{ col }}
    {% if not loop.last %} 
        ,
    {% endif %}
{% endfor %}    

from {{ ref('bronze_bookings') }}


#}



select
{% for colu in columnsForExmp2 %}
    {{ colu }} 
    {% if not loop.last %} , {% endif %}
{% endfor %}
from {{ ref("bronze_hosts") }}