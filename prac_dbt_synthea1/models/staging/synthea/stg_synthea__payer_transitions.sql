{% set column_names = 
    dbt_utils.get_filtered_columns_in_relation( source('staging', 'payer_transitions') ) 
%}


WITH cte_payer_transitions_lower AS (

    SELECT
        {{ lowercase_columns(column_names) }}
    FROM {{ source('staging','payer_transitions') }}
)

, cte_payer_transitions_rename AS (

    SELECT
       CAST(patient AS UUID) AS patient_id
        , memberid AS member_id
        , {{ timestamptz_to_naive("start_date") }} AS coverage_start_datetime
        , {{ timestamptz_to_naive("end_date") }} AS coverage_end_datetime
        , CAST( payer AS UUID) AS payer_id
        , CAST (secondary_payer AS UUID) AS secondary_payer_id
        , plan_ownership AS plan_owner_relationship
        , owner_name AS plan_owner_name
    FROM cte_payer_transitions_lower

)

, cte_payer_transitions_date_columns AS (

    SELECT
        patient_id
        , member_id
        , coverage_start_datetime
        , {{ dbt.cast("coverage_start_datetime", api.Column.translate_type("date")) }} AS coverage_start_date
        , coverage_end_datetime
        , {{ dbt.cast("coverage_end_datetime", api.Column.translate_type("date")) }} AS coverage_end_date
        , payer_id
        , secondary_payer_id
        , plan_owner_relationship
        , plan_owner_name
    FROM cte_payer_transitions_rename

)

SELECT *
FROM cte_payer_transitions_date_columns
