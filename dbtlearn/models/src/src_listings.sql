with raw_listings AS (
    SELECT *
    FROM {{ source('airbnb', 'listings') }}
)
SELECT ID    AS listings_id,
       NAME  AS listings_name,
       LISTING_URL,
       ROOM_TYPE,
       MINIMUM_NIGHTS,
       HOST_ID,
       PRICE AS price_str,
       CREATED_AT,
       UPDATED_AT
FROM RAW_LISTINGS