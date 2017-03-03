# To manage single file permissions

'Restrict access to custom files':
  file.managed:
    - name: '/x/testfile.sh'
    - mode: 600
    - user: root
    - group: root

