
'SUDO for DemoGroup':
  file.managed:
    - name: '/etc/sudoers.d/10-demogroup'
    - source: salt://sudoers/demogroup.sudoer
    - user: root
    - group: root
    - mode: 400
