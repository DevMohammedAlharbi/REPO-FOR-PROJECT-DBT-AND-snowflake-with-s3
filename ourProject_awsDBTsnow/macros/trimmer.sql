{% macro trimmer(column_n, node) %}
   {{ column_n | trim | upper }}
{% endmacro %}