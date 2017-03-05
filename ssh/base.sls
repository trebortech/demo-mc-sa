{% if grains['os_family'] == 'RedHat' %}
    {% set sshd = 'sshd' %}

{% elif grains['os_family'] == 'Debian' %}
    {% set sshd = 'ssh' %}

{% endif %}


"Update PrintMOTD":
  file.replace:
    - name: '/etc/ssh/sshd_config'
    - pattern: 'PrintMotd no'
    - repl: 'PrintMotd yes'
    - backup: False

"Update UsePAM":
  file.replace:
    - name: '/etc/ssh/sshd_config'
    - pattern: 'UsePAM no'
    - repl: 'UsePAM yes'
    - backup: False

"Restart SSHD service":
  cmd.wait:
    - name: 'sudo service {{ sshd }} restart'
    - use_vt: True
    - watch:
      - file: "Update PrintMOTD"
      - file: "Update UsePAM"