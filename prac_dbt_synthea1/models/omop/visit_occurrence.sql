SELECT
    visit_occurrence_id::integer
    , person_id::integer
    , CASE
        WHEN lower(visit_class) = 'er+ip' THEN 262
        WHEN lower(visit_class) IN ('ambulatory', 'wellness', 'outpatient') THEN 9202
        WHEN lower(visit_class) IN ('emergency', 'urgentcare') THEN 9203
        WHEN lower(visit_class) = 'inpatient' THEN 9201
        ELSE 0
    END::integer AS visit_concept_id
    , visit_start_date::date
    , {{ dbt.cast("NULL", api.Column.translate_type("timestamp")) }}::timestamp AS visit_start_datetime
    , visit_end_date::date
    , {{ dbt.cast("NULL", api.Column.translate_type("timestamp")) }}::timestamp AS visit_end_datetime
    , 32827::integer AS visit_type_concept_id
    , {{ dbt.cast("NULL", api.Column.translate_type("integer")) }}::integer  AS provider_id
    , {{ dbt.cast("NULL", api.Column.translate_type("integer")) }}::integer  AS care_site_id
    , visit_class::varchar(50) AS visit_source_value
    , 0::integer AS visit_source_concept_id
    , 0::integer AS admitted_from_concept_id
    , {{ dbt.cast("NULL", api.Column.translate_type("varchar")) }}::varchar(50) AS admitted_from_source_value
    , 0::integer AS discharged_to_concept_id
    , {{ dbt.cast("NULL", api.Column.translate_type("varchar")) }}::varchar(50) AS discharged_to_source_value
    , {{ dbt.cast("NULL", api.Column.translate_type("integer")) }}::integer AS preceding_visit_occurrence_id
FROM {{ ref( 'int__visits') }}
