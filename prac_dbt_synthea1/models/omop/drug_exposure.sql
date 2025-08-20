SELECT
    drug_exposure_id::integer
    , person_id::integer
    , drug_concept_id::integer
    , drug_exposure_start_date::date
    , drug_exposure_start_datetime::timestamp
    , drug_exposure_end_date::date
    , drug_exposure_end_datetime::timestamp
    , verbatim_end_date::date
    , drug_type_concept_id::integer
    , stop_reason::varchar(20)
    , refills::integer
    , quantity::float
    , days_supply::integer
    , sig::varchar(255)
    , route_concept_id::integer
    , lot_number::varchar(50)
    , provider_id::integer
    , visit_occurrence_id::integer
    , visit_detail_id::integer
    , drug_source_value::varchar(50)
    , drug_source_concept_id::integer
    , route_source_value::varchar(50)
    , dose_unit_source_value::varchar(50)
FROM {{ ref('int__drug_exposure') }}
