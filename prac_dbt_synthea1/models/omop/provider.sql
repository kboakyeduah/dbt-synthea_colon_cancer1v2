SELECT
    provider_id::integer
    , provider_name::varchar(255)
    , npi::varchar(20)
    , dea::varchar(20)
    , specialty_concept_id::integer
    , care_site_id::integer
    , year_of_birth::integer
    , gender_concept_id::integer
    , provider_source_value::varchar(50)
    , specialty_source_value::varchar(50)
    , specialty_source_concept_id::integer
    , gender_source_value::varchar(50)
    , gender_source_concept_id::integer
FROM {{ ref( 'int__provider') }}
