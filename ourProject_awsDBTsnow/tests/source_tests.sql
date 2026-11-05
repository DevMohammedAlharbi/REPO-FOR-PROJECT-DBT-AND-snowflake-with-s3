
{{ config (severity='warn', message='There are bookings with amounts less than 200') }}

SELECT
    1
FROM 
    {{ source('staging', 'bookings') }}    
WHERE 
    booking_amount < 200
