SELECT
    {{ dbt.cast("null", api.Column.translate_type("integer")) }}::integer AS metadata_id
    , {{ dbt.cast("null", api.Column.translate_type("integer")) }}::integer AS metadata_concept_id
    , {{ dbt.cast("null", api.Column.translate_type("integer")) }}::integer AS metadata_type_concept_id
    , {{ dbt.cast("null", api.Column.translate_type("varchar")) }}::varchar(250) AS {{ adapter.quote("name") }}
    , {{ dbt.cast("null", api.Column.translate_type("varchar")) }}::varchar(250) AS value_as_string
    , {{ dbt.cast("null", api.Column.translate_type("integer")) }}::integer AS value_as_concept_id
    , {{ dbt.cast("null", api.Column.translate_type("decimal")) }}::float AS value_as_number
    , {{ dbt.cast("null", api.Column.translate_type("date")) }}::date AS metadata_date
    , {{ dbt.cast("null", api.Column.translate_type("timestamp")) }}::timestamp AS metadata_datetime
WHERE 1 = 0
