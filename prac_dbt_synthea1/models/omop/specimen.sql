SELECT
    {{ dbt.cast("null", api.Column.translate_type("integer")) }}::integer AS specimen_id
    , {{ dbt.cast("null", api.Column.translate_type("integer")) }}::integer AS person_id
    , {{ dbt.cast("null", api.Column.translate_type("integer")) }}::integer AS specimen_concept_id
    , {{ dbt.cast("null", api.Column.translate_type("integer")) }}::integer AS specimen_type_concept_id
    , {{ dbt.cast("null", api.Column.translate_type("date")) }}::date AS specimen_date
    , {{ dbt.cast("null", api.Column.translate_type("timestamp")) }}::timestamp AS specimen_datetime
    , {{ dbt.cast("null", api.Column.translate_type("decimal")) }}::float AS quantity
    , {{ dbt.cast("null", api.Column.translate_type("integer")) }}::integer AS unit_concept_id
    , {{ dbt.cast("null", api.Column.translate_type("integer")) }}::integer AS anatomic_site_concept_id
    , {{ dbt.cast("null", api.Column.translate_type("integer")) }}::integer AS disease_status_concept_id
    , {{ dbt.cast("null", api.Column.translate_type("integer")) }}::varchar(50) AS specimen_source_id
    , {{ dbt.cast("null", api.Column.translate_type("varchar")) }}::varchar(50) AS specimen_source_value
    , {{ dbt.cast("null", api.Column.translate_type("varchar")) }}::varchar(50) AS unit_source_value
    , {{ dbt.cast("null", api.Column.translate_type("varchar")) }}::varchar(50) AS anatomic_site_source_value
    , {{ dbt.cast("null", api.Column.translate_type("varchar")) }}::varchar(50) AS disease_status_source_value
WHERE 1 = 0
