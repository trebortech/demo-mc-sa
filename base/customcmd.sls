# Run varios OS commands

'Execute my custom install command':
  cmd.run:
    - name: 'date > /tmp/salt-run'

'Create a file if some other file does not exist':
  cmd.run:
    - name: 'touch /tmp/newfile'
    - creates: '/tmp/salt-run'
