WITH all_observations AS (
    SELECT * FROM {{ ref('int__observation_allergies') }}
    UNION ALL
    SELECT * FROM {{ ref('int__observation_conditions') }}
    UNION ALL
    SELECT * FROM {{ ref('int__observation_observations') }}
)

SELECT
    row_number() OVER (ORDER BY person_id)::integer AS observation_id
    , person_id::integer
    , observation_concept_id::integer
    , observation_date::date
    , observation_datetime::timestamp
    , observation_type_concept_id::integer
    , {{ dbt.cast("null", api.Column.translate_type("decimal")) }}::float AS value_as_number
    , {{ dbt.cast("null", api.Column.translate_type("varchar")) }}::varchar(60) AS value_as_string
    , 0::integer AS value_as_concept_id
    , 0::integer AS qualifier_concept_id
    , 0::integer AS unit_concept_id
    , provider_id::integer
    , visit_occurrence_id::integer
    , visit_detail_id::integer
    , observation_source_value::varchar(50)
    , observation_source_concept_id::integer
    , {{ dbt.cast("null", api.Column.translate_type("varchar")) }}::varchar(50) AS unit_source_value
    , {{ dbt.cast("null", api.Column.translate_type("varchar")) }}::varchar(50) AS qualifier_source_value
    , {{ dbt.cast("null", api.Column.translate_type("varchar")) }}::varchar(50) AS value_source_value
    , {{ dbt.cast("null", api.Column.translate_type("bigint")) }}::integer AS observation_event_id
    , {{ dbt.cast("null", api.Column.translate_type("integer")) }}::integer AS obs_event_field_concept_id
FROM all_observations
