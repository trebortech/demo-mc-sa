# Run varios OS commands

'Execute my custom install command':
  cmd.run:
    - name: 'date > /tmp/demo-test'

'Create a file if some other file does not exist':
  cmd.run:
    - name: 'touch /tmp/demo-test'
    - creates: '/tmp/demo-test2'
