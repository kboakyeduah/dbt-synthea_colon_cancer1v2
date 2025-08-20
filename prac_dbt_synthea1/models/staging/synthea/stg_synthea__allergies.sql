{% set column_names = 
    dbt_utils.get_filtered_columns_in_relation( source('staging', 'allergies') ) 
%}


WITH cte_allergies_lower AS (

    SELECT
        {{ lowercase_columns(column_names) }}
    FROM {{ source('staging','allergies') }}
)

, cte_allergies_rename AS (

    SELECT
        {{ adapter.quote("start_date") }} AS allergy_start_date
        , {{ adapter.quote("stop_date") }} AS allergy_stop_date
        , CAST(patient AS UUID) AS patient_id
        , CAST(encounter AS UUID) AS encounter_id
        , code AS allergy_code
        , {{ adapter.quote("system_code") }} AS allergy_code_system
        , description AS allergy_description
        , {{ adapter.quote("type") }} AS allergy_type
        , category AS allergy_category
        , reaction1 AS reaction_1_code
        , description1 AS reaction_1_description
        , severity1 AS reaction_1_severity
        , reaction2 AS reaction_2_code
        , description2 AS reaction_2_description
        , severity2 AS reaction_2_severity
    FROM cte_allergies_lower

)

SELECT *
FROM cte_allergies_rename
