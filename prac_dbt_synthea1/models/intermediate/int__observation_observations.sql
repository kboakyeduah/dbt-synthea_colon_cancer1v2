SELECT
    p.person_id
    , o.patient_id
    , o.encounter_id
    , srctostdvm.target_concept_id AS observation_concept_id
    , o.observation_date
    , o.observation_datetime
    , 38000280 AS observation_type_concept_id
    , vd.provider_id
    , vd.visit_occurrence_id
    , vd.visit_detail_id
    , o.observation_code AS observation_source_value
    , srctosrcvm.source_concept_id AS observation_source_concept_id
FROM {{ ref ('stg_synthea__observations') }} AS o
INNER JOIN {{ ref ('int__source_to_standard_vocab_map') }} AS srctostdvm
    ON
        o.observation_code = srctostdvm.source_code
        AND srctostdvm.target_domain_id = 'observation'
        AND srctostdvm.target_vocabulary_id = 'loinc'
        AND srctostdvm.target_standard_concept = 's'
        AND srctostdvm.target_invalid_reason IS null
INNER JOIN {{ ref ('int__source_to_source_vocab_map') }} AS srctosrcvm
    ON
        o.observation_code = srctosrcvm.source_code
        AND srctosrcvm.source_vocabulary_id = 'loinc'
        AND srctosrcvm.source_domain_id = 'observation'
INNER JOIN {{ ref ('int__person') }} AS p
    ON o.patient_id = p.person_source_value::UUID
LEFT JOIN {{ ref ('int__visit_detail') }} AS vd
    ON o.encounter_id = vd.encounter_id::UUID
