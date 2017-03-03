
'Demo user configured':
  user.present:
    - name: demo1
    - fullname: 'demo user'
    - shell: '/bin/bash'
    - password: ''
    - groups:
      - demogroup
    - require:
      - group: 'Demo Group'
  ssh_auth.present:
    - user: demo1
    - source: salt://users/demo1.pub
    - config: '.ssh/authorized_keys'
    - require:
      - user: 'demo1'
