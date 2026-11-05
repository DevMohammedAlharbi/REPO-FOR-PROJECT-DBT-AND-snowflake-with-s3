{% set configs = 
  [
          {  "table" : "AIRBNB.GOLD.OBT" ,
          "columns" : "GOLD_OBT.BOOKING_ID , GOLD_OBT.HOST_ID , GOLD_OBT.LISTING_ID , GOLD_OBT.BOOKING_AMOUNT , GOLD_OBT.TOTAL_BOOKING_AMOUNT , GOLD_OBT.CLEANING_FEE , GOLD_OBT.SERVICE_FEE , GOLD_OBT.ACCOMMODATES , GOLD_OBT.BEDROOMS , GOLD_OBT.BATHROOMS , GOLD_OBT.PRICE_PER_NIGHT " ,
            "alias" : "GOLD_OBT"
          }
        ,
          {
            "table" : "AIRBNB.GOLD.DIM_LISTINGS" ,
          "columns" : "",
            "alias" : "GOLD_LISTINGS" ,
          "join_on" : "GOLD_OBT.LISTING_ID = GOLD_LISTINGS.LISTING_ID"
          }
        ,
          { 
            "table" : "AIRBNB.GOLD.DIM_HOSTS" ,
          "columns" : "" ,
            "alias" : "GOLD_HOSTS" ,
          "join_on" : "GOLD_OBT.HOST_ID = GOLD_HOSTS.HOST_ID"
          }
  ]
%}


SELECT 
           {{ configs[0]['columns'] }}

FROM 
    {% for config in configs %}
         {% if loop.first %}
              {{ config['table'] }} AS {{ config['alias'] }}
         {% else %}
               LEFT JOIN {{ config['table'] }} AS {{ config['alias'] }} 
               ON {{ config['join_on'] }}
         {% endif %}
    {% endfor %}