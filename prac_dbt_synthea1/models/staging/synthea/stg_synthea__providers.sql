{% set column_names = 
    dbt_utils.get_filtered_columns_in_relation( source('staging', 'providers') ) 
%}


WITH cte_providers_lower AS (

    SELECT
        {{ lowercase_columns(column_names) }}
    FROM {{ source('staging','providers') }}
)

, cte_providers_rename AS (

    SELECT
        id AS provider_id
        , organization AS organization_id
        , {{ adapter.quote("name") }} AS provider_name
        , gender AS provider_gender
        , speciality AS provider_specialty
        , address AS provider_address
        , city AS provider_city
        , state AS provider_state
        , zip AS provider_zip
        , lat AS provider_latitude
        , lon AS provider_longitude
    FROM cte_providers_lower

)

SELECT *
FROM cte_providers_rename
