SELECT
    po.procedure_occurrence_id::integer
    , po.person_id::integer
    , po.procedure_concept_id::integer
    , po.procedure_date::date
    , po.procedure_datetime::timestamp
    , po.procedure_end_date::date
    , po.procedure_end_datetime::timestamp
    , po.procedure_type_concept_id::integer
    , po.modifier_concept_id::integer
    , po.quantity::integer
    , vd.provider_id::integer
    , vd.visit_occurrence_id::integer
    , vd.visit_detail_id::integer
    , po.procedure_source_value::varchar(50)
    , po.procedure_source_concept_id::integer
    , po.modifier_source_value::varchar(50)
FROM {{ ref( 'int__procedure_occurrence') }} AS po
LEFT JOIN {{ ref( 'int__visit_detail') }} AS vd
    ON po.encounter_id = vd.encounter_id::UUID
