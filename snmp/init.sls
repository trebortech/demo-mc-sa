"SNMPD Package installed":
  pkg.installed:
    - pkgs:
      - snmp
      - snmpd

"SNMPD configuration file":
  file.managed:
    - name: /etc/snmp/snmpd.conf
    - source: salt://snmp/snmpd.conf
    - user: root
    - group: root
    - mode: 400

"Confirm SNMPD service started":
  service.running:
    - name: snmpd
    - watch:
      - file: "SNMPD configuration file"