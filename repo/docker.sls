
{% if grains['os_family'] == 'RedHat' %}
  {% set repo = 'main' %}
  {% set lsb_dist = salt['grains.get']('os, '')|lower %}
  {% set dist_version = salt['grains.get']('osmajorrelease', '') %}

"Add YUM Docker repo":
  pkgrepo.managed:
    - name: "Docker-{{ repo }}-Repository"
    - humanname: "docker-{{ repo }}-repo"
    - file: "/etc/yum.repos.d/docker-{{ repo }}.repo"
    - baseurl: "https://yum.dockerproject.org/repo/{{ repo }}/{{ lsb_dist }}/{{ dist_version }}"
    - enabled: True
    - gpgkey: https://yum.dockerproject.org/gpg

{% elif grains['os_family'] == 'Debian' %}
  {% set repo = 'main' %}
  {% set lsb_dist = salt['grains.get']('lsb_distrib_id', '')|lower %}
  {% set dist_version = salt['grains.get']('lsb_distrib_codename', '') %}

"Add APT Docker repo":
  pkgrepo.managed:
    - name: "deb https://apt.dockerproject.org/repo {{ lsb_dist }}-{{ dist_version }} {{ repo }}"
    - file: /etc/apt/sources.list.d/docker-main.list
    - keyid: 58118E89F3A912897C070ADBF76221572C52609D
    - keyserver: hkp://p80.pool.sks-keyservers.net:80

{% endif %}