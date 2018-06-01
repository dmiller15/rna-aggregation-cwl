class: CommandLineTool
cwlVersion: v1.0
$namespaces:
  sbg: 'https://www.sevenbridges.com'
id: fetch_files
baseCommand:
  - curl
inputs:
  - id: file_uuid
    type: string
    inputBinding:
      position: 0
outputs:
  - id: pulled_file
    type: File
label: fetch_files
requirements:
  - class: DockerRequirement
    dockerPull: 'ubuntu:14.04'
