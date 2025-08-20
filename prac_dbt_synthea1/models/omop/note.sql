SELECT
    {{ dbt.cast("null", api.Column.translate_type("integer")) }}::integer AS note_id
    , {{ dbt.cast("null", api.Column.translate_type("integer")) }}::integer AS person_id
    , {{ dbt.cast("null", api.Column.translate_type("date")) }}::date AS note_date
    , {{ dbt.cast("null", api.Column.translate_type("timestamp")) }}::timestamp AS note_datetime
    , {{ dbt.cast("null", api.Column.translate_type("integer")) }}::integer AS note_type_concept_id
    , {{ dbt.cast("null", api.Column.translate_type("integer")) }}::integer AS note_class_concept_id
    , {{ dbt.cast("null", api.Column.translate_type("varchar")) }}::varchar(250) AS note_title
    , {{ dbt.cast("null", api.Column.translate_type("varchar")) }}::varchar(250) AS note_text
    , {{ dbt.cast("null", api.Column.translate_type("integer")) }}::integer AS encoding_concept_id
    , {{ dbt.cast("null", api.Column.translate_type("integer")) }}::integer AS language_concept_id
    , {{ dbt.cast("null", api.Column.translate_type("integer")) }}::integer AS provider_id
    , {{ dbt.cast("null", api.Column.translate_type("integer")) }}::integer AS visit_occurrence_id
    , {{ dbt.cast("null", api.Column.translate_type("integer")) }}::integer AS visit_detail_id
    , {{ dbt.cast("null", api.Column.translate_type("varchar")) }}::varchar(50) AS note_source_value
    , {{ dbt.cast("null", api.Column.translate_type("integer")) }}::integer AS note_event_id
    , {{ dbt.cast("null", api.Column.translate_type("integer")) }}::integer AS note_event_field_concept_id
WHERE 1 = 0
