SELECT
    person_id::integer
    , gender_concept_id::integer
    , year_of_birth::integer
    , month_of_birth::integer
    , day_of_birth::integer
    , birth_datetime::timestamp
    , race_concept_id::integer
    , ethnicity_concept_id::integer
    , location_id::integer
    , provider_id::integer
    , care_site_id::integer
    , person_source_value::varchar(50)
    , gender_source_value
    , gender_source_concept_id
    , race_source_value
    , race_source_concept_id
    , ethnicity_source_value
    , ethnicity_source_concept_id
FROM {{ ref('int__person') }}
