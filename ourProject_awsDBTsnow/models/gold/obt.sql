{% set configs = 
  [
          {  "table" : "AIRBNB.SILVER.SILVER_BOOKINGS" ,
          "columns" : "SILVER_BOOKINGS.*" ,
            "alias" : "SILVER_BOOKINGS"
          }
        ,
          {
            "table" : "AIRBNB.SILVER.SILVER_LISTINGS" ,
          "columns" : "SILVER_LISTINGS.host_id , SILVER_LISTINGS.PROPERTY_TYPE , SILVER_LISTINGS.ROOM_TYPE , SILVER_LISTINGS.CITY , SILVER_LISTINGS.COUNTRY , SILVER_LISTINGS.ACCOMMODATES , SILVER_LISTINGS.BEDROOMS , SILVER_LISTINGS.BATHROOMS , SILVER_LISTINGS.PRICE_PER_NIGHT , SILVER_LISTINGS.PRICE_PER_NIGHT_TAG , SILVER_LISTINGS.CREATED_AT as LISTING_CREATED_AT " ,
            "alias" : "SILVER_LISTINGS" ,
          "join_on" : "SILVER_BOOKINGS.listing_id = SILVER_LISTINGS.listing_id"
          }
        ,
          { 
            "table" : "AIRBNB.SILVER.SILVER_HOSTS" ,
          "columns" : "SILVER_HOSTS.host_name , SILVER_HOSTS.host_since , SILVER_HOSTS.IS_SUPERHOST ,  SILVER_HOSTS.RESPONSE_RATE_QUALITY , SILVER_HOSTS.CREATED_AT as HOST_CREATED_AT " ,
            "alias" : "SILVER_HOSTS" ,
          "join_on" : "SILVER_LISTINGS.host_id = SILVER_HOSTS.host_id"
          }
  ]
%}


SELECT 
    {% for config in configs %}
           {{ config.columns }} {% if not loop.last %} , {% endif %}
    {% endfor %}

FROM 
    {% for config in configs %}
         {% if loop.first %}
              {{ config['table'] }} AS {{ config['alias'] }}
         {% else %}
               LEFT JOIN {{ config['table'] }} AS {{ config['alias'] }} 
               ON {{ config['join_on'] }}
         {% endif %}
    {% endfor %}