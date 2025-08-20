SELECT
    'dbt-synthea'::varchar(255) AS cdm_source_name
    , 'dbt-synthea'::varchar(25) AS cdm_source_abbreviation
    , 'OHDSI'::varchar(255) AS cdm_holder
    , 'An OMOP CDM derived from a Synthea dataset using dbt.'::varchar(255) AS source_description
    , 'https://synthetichealth.github.io/synthea/' AS source_documentation_reference
    , 'https://github.com/OHDSI/dbt-synthea' AS cdm_etl_reference
    , current_date::date AS source_release_date
    , current_date::date AS cdm_release_date
    , '5.4'::varchar(10) AS cdm_version
    , vocabulary_version::varchar(20)
    , 798878::integer AS cdm_version_concept_id
FROM {{ ref('stg_vocabulary__vocabulary') }}
WHERE vocabulary_id = 'None'
