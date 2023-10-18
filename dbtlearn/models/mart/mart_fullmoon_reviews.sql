{{ config(
    materialized= 'table')
 }}

    WITH fct_reviews as (
        SELECT *
        FROM {{ ref('fct_reviews') }}
    ),
         full_moon_dates AS (
             SELECT *
             FROM {{ ref('seed_full_moon_dates') }}
         )

    select r.*,
           CASE
               WHEN fm.FULL_MOON_DATE IS NULL THEN 'not full moon'
               ELSE 'full moon' END AS is_full_moon
    from fct_reviews r
             left join full_moon_dates fm
                       on (TO_DATE(r.REVIEW_DATE) = DATEADD(DAY, 1, fm.FULL_MOON_DATE))