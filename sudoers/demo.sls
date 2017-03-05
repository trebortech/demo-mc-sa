
'SUDO for DemoGroup':
  file.managed:
    - name: '/etc/sudoers.d/10-demogroup'
    - source: salt://{{ slspath }}/demogroup.sudoer
    - user: root
    - group: root
    - mode: 400
