WITH all_costs AS (

    SELECT
        drug_exposure_id AS cost_event_id
        , 'Drug' AS cost_domain_id
        , drug_base_cost AS total_cost
        , drug_paid_by_payer AS paid_by_payer
    FROM {{ ref('int__drug_exposure') }}
    UNION ALL
    SELECT
        procedure_occurrence_id AS cost_event_id
        , 'Procedure' AS cost_domain_id
        , procedure_base_cost AS total_cost
        , {{ dbt.cast("null", api.Column.translate_type("numeric")) }} AS paid_by_payer
    FROM {{ ref('int__procedure_occurrence') }}
    UNION ALL
    SELECT
        visit_detail_id AS cost_event_id
        , 'Visit' AS cost_domain_id
        , total_encounter_cost AS total_cost
        , encounter_payer_coverage AS paid_by_payer
    FROM {{ ref('int__visit_detail') }}

)

SELECT
    row_number() OVER (ORDER BY cost_domain_id, cost_event_id)::integer AS cost_id
    , cost_event_id::integer
    , cost_domain_id::varchar(20)
    , 32814::integer AS cost_type_concept_id
    , 44818668::integer AS currency_concept_id
    , {{ dbt.cast("null", api.Column.translate_type("numeric")) }}::float AS total_charge
    , total_cost::float
    , {{ dbt.cast("null", api.Column.translate_type("numeric")) }}::float AS total_paid
    , paid_by_payer::float
    , {{ dbt.cast("null", api.Column.translate_type("numeric")) }}::float AS paid_by_patient
    , {{ dbt.cast("null", api.Column.translate_type("numeric")) }}::float AS paid_patient_copay
    , {{ dbt.cast("null", api.Column.translate_type("numeric")) }}::float AS paid_patient_coinsurance
    , {{ dbt.cast("null", api.Column.translate_type("numeric")) }}::float AS paid_patient_deductible
    , {{ dbt.cast("null", api.Column.translate_type("numeric")) }}::float AS paid_by_primary
    , {{ dbt.cast("null", api.Column.translate_type("numeric")) }}::float AS paid_ingredient_cost
    , {{ dbt.cast("null", api.Column.translate_type("numeric")) }}::float AS paid_dispensing_fee
    , {{ dbt.cast("null", api.Column.translate_type("integer")) }}::integer AS payer_plan_period_id
    , {{ dbt.cast("null", api.Column.translate_type("numeric")) }}::float AS amount_allowed
    , {{ dbt.cast("null", api.Column.translate_type("integer")) }}::integer AS revenue_code_concept_id
    , {{ dbt.cast("null", api.Column.translate_type("varchar")) }}::varchar(50) AS revenue_code_source_value
    , {{ dbt.cast("null", api.Column.translate_type("integer")) }}::integer AS drg_concept_id
    , {{ dbt.cast("null", api.Column.translate_type("varchar")) }}::varchar(3) AS drg_source_value
FROM all_costs
