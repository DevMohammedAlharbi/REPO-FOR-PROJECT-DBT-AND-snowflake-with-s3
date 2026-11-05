{% set my_nights_booked = 2 %} -- 1
{% set flag = 5 %} -- 2


-- 1
-- select * from {{ ref('bronze_bookings') }} where NIGHTS_BOOKED > {{ my_nights_booked }} 

-- 2
select * from {{ ref('bronze_bookings') }} 
{% if flag == 1 %}
  where NIGHTS_BOOKED > 10
{% else %}
  where NIGHTS_BOOKED = 8
{% endif %}

-- {%   set variable_name = value   %}
-- Hardcode : where NIGHTS_BOOKED > 1