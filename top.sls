{% set tz = grains['timezone']  %}

timezone.set:
  timezone.system:
    - name: {{ tz }}
