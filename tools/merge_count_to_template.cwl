class: CommandLineTool
cwlVersion: v1.0
$namespaces:
  sbg: 'https://www.sevenbridges.com'
id: merge_count_to_template
baseCommand: []
inputs:
  - id: merge_file
    type: File
    inputBinding:
      position: 0
      shellQuote: false
  - id: template_file
    type: File
    inputBinding:
      position: 1
      shellQuote: false
outputs:
  - id: harmonized_counts
    type: File
    outputBinding:
      glob: $(inputs.merge_file.nameroot + ".allFields" + inputs.merge_file.nameext)
label: merge_count_to_template
arguments:
  - position: 0
    prefix: ''
    shellQuote: false
    valueFrom: >-
      awk -F'\t' 'FNR==1&&NR==1{n=split(FILENAME,f,"/"); print "\t"f[n]}
      NR==FNR{a[$1]=$2;next} {print (a[$1]=="" ? $1 FS NA : $1 FS a[$1])}'
requirements:
  - class: ShellCommandRequirement
  - class: DockerRequirement
    dockerPull: 'ubuntu:14.04'
  - class: InlineJavascriptRequirement
stdout: $(inputs.merge_file.nameroot + ".allFields" + inputs.merge_file.nameext)
