SELECT
    visit_detail_id::integer
    , person_id::integer
    , visit_detail_concept_id::integer
    , visit_detail_start_date::date
    , visit_detail_start_datetime::timestamp
    , visit_detail_end_date::date
    , visit_detail_stop_datetime::timestamp
    , visit_detail_type_concept_id::integer
    , provider_id::integer
    , care_site_id::integer
    , admitted_from_concept_id::integer
    , discharged_to_concept_id::integer
    , preceding_visit_detail_id::integer
    , visit_detail_source_value::varchar(50)
    , visit_detail_source_concept_id::integer
    , admitted_from_source_value::varchar(50)
    , discharged_to_source_value::varchar(50)
    , parent_visit_detail_id::integer
    , visit_occurrence_id::integer
FROM {{ ref( 'int__visit_detail') }}
