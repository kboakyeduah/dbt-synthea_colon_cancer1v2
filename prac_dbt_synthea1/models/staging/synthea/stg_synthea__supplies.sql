{% set column_names = 
    dbt_utils.get_filtered_columns_in_relation( source('staging', 'supplies') ) 
%}


WITH cte_supplies_lower AS (

    SELECT
        {{ lowercase_columns(column_names) }}
    FROM {{ source('staging','supplies') }}
)

, cte_supplies_rename AS (

    SELECT
        {{ adapter.quote("date") }} AS supply_date
        , CAST(patient AS UUID) AS patient_id
        ,CAST(encounter AS UUID) AS encounter_id
        , code AS supply_code
        , description AS supply_description
        , quantity AS supply_quantity
    FROM cte_supplies_lower

)

SELECT *
FROM cte_supplies_rename
