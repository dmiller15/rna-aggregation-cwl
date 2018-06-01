class: Workflow
cwlVersion: v1.0
id: mrna_aggregation
label: mrna_aggregation
$namespaces:
  sbg: 'https://www.sevenbridges.com'
inputs:
  - id: count_files
    type: 'File[]'
    'sbg:x': 0
    'sbg:y': 7
outputs:
  - id: aggregate_counts
    outputSource:
      - paste_filled_files/aggregate_counts
    type: File
    'sbg:x': 884.9796142578125
    'sbg:y': 7
steps:
  - id: paste_filled_files
    in:
      - id: output_filename
        default: aggnew.tsv
      - id: harmonized_counts
        source:
          - merge_count_to_template/harmonized_counts
    out:
      - id: aggregate_counts
    run: ../tools/paste_filled_files.cwl
    label: paste_filled_files
    'sbg:x': 595.1983642578125
    'sbg:y': 7
  - id: merge_count_to_template
    in:
      - id: merge_file
        source: count_files
      - id: template_file
        source: generate_template_file/output
    out:
      - id: harmonized_counts
    run: ../tools/merge_count_to_template.cwl
    label: merge_count_to_template
    scatter:
      - merge_file
    'sbg:x': 274.125
    'sbg:y': -151.5
  - id: generate_template_file
    in:
      - id: count_files
        source:
          - count_files
      - id: template_filename
        default: template.txt
    out:
      - id: output
    run: ../tools/generate_template_file.cwl
    label: generate_template_file
    'sbg:x': 117.125
    'sbg:y': -226.5
requirements:
  - class: ScatterFeatureRequirement
