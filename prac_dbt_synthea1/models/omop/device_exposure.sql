SELECT
    row_number() OVER (ORDER BY p.person_id)::integer AS device_exposure_id
    , p.person_id::integer
    , srctostdvm.target_concept_id::integer AS device_concept_id
    , d.device_start_date::date AS device_exposure_start_date
    , d.device_start_datetime::timestamp AS device_exposure_start_datetime
    , d.device_stop_date::date AS device_exposure_end_date
    , d.device_stop_datetime::timestamp AS device_exposure_end_datetime
    , 32827::integer AS device_type_concept_id
    , d.udi::varchar(255) AS unique_device_id
    , {{ dbt.cast("null", api.Column.translate_type("varchar")) }}::varchar(255) AS production_id
    , {{ dbt.cast("null", api.Column.translate_type("integer")) }}::integer AS quantity
    , vd.provider_id::integer
    , vd.visit_occurrence_id::integer
    , vd.visit_detail_id::integer
    , d.device_code::varchar(50) AS device_source_value
    , srctosrcvm.source_concept_id::integer AS device_source_concept_id
    , {{ dbt.cast("null", api.Column.translate_type("integer")) }}::integer AS unit_concept_id
    , {{ dbt.cast("null", api.Column.translate_type("varchar")) }}::varchar(50) AS unit_source_value
    , {{ dbt.cast("null", api.Column.translate_type("integer")) }}::integer AS unit_source_concept_id
FROM {{ ref('stg_synthea__devices') }} AS d
INNER JOIN {{ ref ('int__source_to_standard_vocab_map') }} AS srctostdvm
    ON
        d.device_code = srctostdvm.source_code
        AND srctostdvm.target_domain_id = 'device'
        AND srctostdvm.target_vocabulary_id = 'snomed'
        AND srctostdvm.source_vocabulary_id = 'snomed'
        AND srctostdvm.target_standard_concept = 's'
        AND srctostdvm.target_invalid_reason IS null
INNER JOIN {{ ref ('int__source_to_source_vocab_map') }} AS srctosrcvm
    ON
        d.device_code = srctosrcvm.source_code
        AND srctosrcvm.source_vocabulary_id = 'snomed'
INNER JOIN {{ ref ('int__person') }} AS p
    ON d.patient_id = p.person_source_value::UUID
LEFT JOIN {{ ref ('int__visit_detail') }} AS vd
    ON d.encounter_id = vd.encounter_id::UUID
