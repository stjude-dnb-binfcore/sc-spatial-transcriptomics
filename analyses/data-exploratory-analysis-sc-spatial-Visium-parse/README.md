# Pipeline for data exploratory analysis (sc-spatial Visium, parse-style metadata)

Working module for exploratory metadata and sample layout review in the **sc-spatial-transcriptomics** project. Logic is adapted from the Parse cohort exploratory module; `input/` and `results/` are seeded with the Parse cohort example for development and Visium wiring.

Parse cohort example data (read-only reference): [`../data-exploratory-analysis-parse-example`](../data-exploratory-analysis-parse-example).

## Provenance

- Source: [sc-cohort-design-evaluation](https://github.com/stjude-dnb-binfcore/sc-cohort-design-evaluation) at `analyses/data-exploratory-analysis-sc-snap-parse`
- Commit: `0260a57865edec3fed19c3d7b978bee97ce9d630` (branch `main`)

## Usage

`run-data-exploratory-analysis.sh` is designed to be run as if it was called from this module directory even when called from outside of this directory.

Parameters according to the project and analysis strategy will need to be specified in:

- `project_parameters.Config.yaml` at `root_dir` (Parse-style keys such as `metadata_dir_parse` are still required until this module is refactored for spatial yaml).

Note: this module is designed to be run using [the Singularity container for scRNA-seq project analysis](https://github.com/stjude-dnb-binfcore/devops-containers/tree/main/analyses/sc-rna-seq/run-container) (same stack as [run-container/README.md](../../run-container/README.md) in this repo).

### Run module on an interactive session on HPC within the container

From an interactive compute node (while within the container):

```
bash run-data-exploratory-analysis.sh
```

### Run module by using lsf on HPC with the container

```
bsub < lsf-script.txt
```

## Folder content

Scripts to analyze composition of sublibraries and samples (Parse-style loading tables), oriented toward Visium spatial workflow development.

## Folder structure

```
data-exploratory-analysis-sc-spatial-Visium-parse/
├── 01-data-exploratory-analysis.Rmd
├── input
├── lsf-script.txt
├── plots
|   └── Report-data-exploratory-analysis-sc-spatial-Visium-parse-<Sys.Date()>.html
├── README.md
├── results
├── run-data-exploratory-analysis.R
├── run-data-exploratory-analysis.sh
└── util
|   └── function-create-common-columns.R
```
