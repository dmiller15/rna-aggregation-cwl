class: CommandLineTool
cwlVersion: v1.0
$namespaces:
  sbg: 'https://www.sevenbridges.com'
id: generate_row_swap
baseCommand: []
inputs:
  - id: template_file
    type: File
  - id: output_filename
    type: string
    inputBinding:
      position: 90
      prefix: '-o'
      shellQuote: false
outputs:
  - id: row_swap_file
    type: File
    outputBinding:
      glob: inputs.output_filename
label: generate_row_swap
arguments:
  - position: 0
    prefix: ''
    shellQuote: false
    valueFrom: chmod 1777 /tmp
  - position: 1
    prefix: ''
    shellQuote: false
    valueFrom: >-
      && /usr/sbin/mysqld --defaults-file=/etc/mysql/my.cnf --user=mysql
      --daemonize
  - position: 3
    prefix: ''
    shellQuote: false
    valueFrom: >-
      && awk '{split($1,a,"."); print a[1]}' inputs.template_file.path | python
      db_query.py
requirements:
  - class: ShellCommandRequirement
  - class: DockerRequirement
    dockerPull: quay.io/dmiller15/ensembl-gene-tool
