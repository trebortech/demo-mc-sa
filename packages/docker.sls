
# This will be pulled from base states for core repo
include:
  - pip


{% if grains['os_family'] == 'Debian' %}
  {% set kernel_release = salt['grains.get']('kernelrelease', '') %}

# Install kernel extras
"Install kernel extras":
  pkg.installed:
    - pkgs:
      - linux-image-extra-{{ kernel_release }}
      - linux-image-extra-virtual
      - apparmor
      - apt-transport-https
      - ca-certificates
      - docker-engine
    - upgrade: True

{% endif %}

"Install Docker":
  pkg.installed:
    - name: docker-engine
    - refresh: True
    - pkg: docker-engine

"Start Docker Service":
  service.running:
    - name: docker
    - reload: True
    - init_delay: 10
    - enable: True
    - require:
      - pkg: "Install Docker"

"Docker Python API":
  pip.installed:
    - name: docker-py
    - upgrade: True
    - require:
      - service: "Start Docker Service"
      - cmd: "Update PIP"
