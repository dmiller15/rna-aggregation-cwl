class: CommandLineTool
cwlVersion: v1.0
$namespaces:
  sbg: 'https://www.sevenbridges.com'
id: generate_template_file
baseCommand:
  - sort
inputs:
  - id: count_files
    type: 'File[]'
    inputBinding:
      position: 1
      shellQuote: false
  - id: template_filename
    type: string
outputs:
  - id: output
    type: File
    outputBinding:
      glob: $(inputs.template_filename)
label: generate_template_file
arguments:
  - position: 5
    prefix: ''
    shellQuote: false
    valueFrom: '| awk ''{print $1}'''
  - position: 0
    prefix: ''
    shellQuote: false
    valueFrom: '-s -k1,1 -u'
requirements:
  - class: ShellCommandRequirement
  - class: DockerRequirement
    dockerPull: 'ubuntu:14.04'
  - class: InlineJavascriptRequirement
stdout: $(inputs.template_filename)
