SELECT
    {{ dbt.cast("null", api.Column.translate_type("integer")) }}::integer AS dose_era_id
    , {{ dbt.cast("null", api.Column.translate_type("integer")) }}::integer AS person_id
    , {{ dbt.cast("null", api.Column.translate_type("integer")) }}::integer AS drug_concept_id
    , {{ dbt.cast("null", api.Column.translate_type("integer")) }}::integer AS unit_concept_id
    , {{ dbt.cast('null', api.Column.translate_type("decimal")) }}::float AS dose_value
    , {{ dbt.cast('null', api.Column.translate_type("date")) }}::date AS dose_era_start_date
    , {{ dbt.cast('null', api.Column.translate_type("date")) }}::date AS dose_era_end_date
WHERE 1 = 0
