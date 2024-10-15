WITH staging AS (
    SELECT *
    FROM {{ref('stage_franchise')}}
),

DEUPED AS (
    SELECT*
    FROM staging
    QUALIFY ROW_NUMBER()
    OVER (PARTITION BY FRANCHISE_ID ORDER BY OWNER CITY) = 1
)

SELECT *
FROM DEUPED