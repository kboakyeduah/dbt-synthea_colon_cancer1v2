/* outpatient visits */

SELECT
    encounter_id::text AS visit_id
    , encounter_id::text
    , person_id::text
    , encounter_class AS visit_class
    , encounter_start_date AS visit_start_date
    , encounter_stop_date AS visit_end_date
FROM {{ ref( 'int__encounters') }}
WHERE encounter_class IN ('ambulatory', 'wellness', 'outpatient')
-- only include single-day visits
AND encounter_start_date = encounter_stop_date
