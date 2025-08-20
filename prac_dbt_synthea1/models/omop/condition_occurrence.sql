SELECT
    row_number() OVER (ORDER BY p.person_id)::integer AS condition_occurrence_id
    , p.person_id::integer
    , srctostdvm.target_concept_id::integer AS condition_concept_id
    , c.condition_start_date::date
    , {{ dbt.cast("null", api.Column.translate_type("timestamp")) }}::timestamp AS condition_start_datetime
    , c.condition_stop_date::date AS condition_end_date
    , {{ dbt.cast("null", api.Column.translate_type("timestamp")) }}::timestamp AS condition_end_datetime
    , 32827::integer AS condition_type_concept_id
    , {{ dbt.cast("null", api.Column.translate_type("varchar")) }}::varchar(20) AS stop_reason
    , vd.provider_id::integer
    , vd.visit_occurrence_id::integer
    , vd.visit_detail_id::integer
    , c.condition_code::varchar(50) AS condition_source_value
    , srctosrcvm.source_concept_id::integer AS condition_source_concept_id
    , {{ dbt.cast("null", api.Column.translate_type("varchar")) }}::varchar(50) AS condition_status_source_value
    , 0::integer AS condition_status_concept_id
FROM {{ ref('stg_synthea__conditions') }} AS c
INNER JOIN {{ ref ('int__source_to_standard_vocab_map') }} AS srctostdvm
    ON
        c.condition_code = srctostdvm.source_code
        AND srctostdvm.target_domain_id = 'condition'
        AND srctostdvm.target_vocabulary_id = 'snomed'
        AND srctostdvm.source_vocabulary_id = 'snomed'
        AND srctostdvm.target_standard_concept = 's'
        AND srctostdvm.target_invalid_reason IS NULL
INNER JOIN {{ ref ('int__source_to_source_vocab_map') }} AS srctosrcvm
    ON
        c.condition_code = srctosrcvm.source_code
        AND srctosrcvm.source_vocabulary_id = 'snomed'
        AND srctosrcvm.source_domain_id = 'condition'
LEFT JOIN {{ ref ('int__visit_detail') }} AS vd
    ON c.encounter_id = vd.encounter_id::UUID
INNER JOIN {{ ref ('int__person') }} AS p
    ON c.patient_id = p.person_source_value::UUID
