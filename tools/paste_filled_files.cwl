class: CommandLineTool
cwlVersion: v1.0
$namespaces:
  sbg: 'https://www.sevenbridges.com'
id: paste_filled_files
baseCommand: []
inputs:
  - id: output_filename
    type: string
  - id: harmonized_counts
    type: 'File[]'
    inputBinding:
      position: 1
      shellQuote: false
outputs:
  - id: aggregate_counts
    type: File
    outputBinding:
      glob: $(inputs.output_filename)
label: paste_filled_files
arguments:
  - position: 0
    prefix: ''
    shellQuote: false
    valueFrom: >-
      awk -F'\t' '{ a[FNR] = (a[FNR] ? a[FNR] FS : $1 FS) $2} END {
      for(i=1;i<=FNR;i++) print a[i] }'
requirements:
  - class: ShellCommandRequirement
  - class: DockerRequirement
    dockerPull: 'ubuntu:14.04'
  - class: InlineJavascriptRequirement
stdout: $(inputs.output_filename)
