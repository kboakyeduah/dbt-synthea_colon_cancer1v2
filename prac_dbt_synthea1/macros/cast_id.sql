{% macro cast_id(column_name) %}
    CAST({{ column_name }} AS varchar)
{% endmacro %}
