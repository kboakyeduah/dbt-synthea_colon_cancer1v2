SELECT
    location_id::integer
    , address_1::varchar(50)
    , {{ dbt.cast("null", api.Column.translate_type("varchar")) }}::varchar(50) AS address_2
    , city::varchar(50)
    , state::varchar(2)
    , zip::varchar(9)
    , county::varchar(20)
    , location_source_value::varchar(50)
    , {{ dbt.cast("null", api.Column.translate_type("integer")) }}::integer AS country_concept_id
    , {{ dbt.cast("null", api.Column.translate_type("varchar")) }}::varchar(80) AS country_source_value
    , {{ dbt.cast("null", api.Column.translate_type("decimal")) }}::float AS latitude
    , {{ dbt.cast("null", api.Column.translate_type("decimal")) }}::float AS longitude
FROM {{ ref('int__location') }}
