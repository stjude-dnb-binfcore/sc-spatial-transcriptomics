<p align="center">
  <img src="figures/img/DNB-BINF-Core-logo.png" alt="DNB Bioinformatics Core logo" width="560px" />
</p>

# Single Cell Spatial Transcriptomics (sc-spatial-transcriptomics)

Workflow and analysis modules for **single-cell spatial transcriptomics** data from **10x Genomics** platforms. This repository is developed by the [Bioinformatics Core](https://www.stjude.org/research/departments/developmental-neurobiology/shared-resources/bioinformatic-core.html) and the [Center for Spatial Omics](https://www.stjude.org/research/why-st-jude/shared-resources/spatial-omics.html) at St. Jude Children's Research Hospital, following the same modular layout as the [sc-rna-seq-snap](https://github.com/stjude-dnb-binfcore/sc-rna-seq-snap) pipeline.

----

### 🚧 Under Construction - Stay tuned and check back soon! 👀

Analysis modules, project configuration, and full-pipeline orchestration are still being defined. You can already use the **container runners** and **figure/palette utilities**; module-specific code will be added under `analyses/` as it becomes available.

----

## Table of Contents

1. [Overview](#overview)
2. [Getting Started](#getting-started)
3. [How to Use This Repository](#how-to-use-this-repository)
4. [Repository Layout](#repository-layout)
5. [Planned Additions](#planned-additions)
6. [Authors](#authors)
7. [Contact](#contact)

## Overview

This project will provide self-contained **analysis modules** that can be run independently or as part of a larger spatial workflow (QC, preprocessing, clustering, annotation, reporting, and related steps—to be documented in [analyses/README.md](analyses/README.md)).

**Compute environment:** Until a dedicated spatial image is built, workflows use the same RStudio / Seurat stack as **scRNA-Seq SNAP** (`R v4.4.0`, `Seurat v4.4.0`). See [run-container/README.md](run-container/README.md) for Singularity (HPC) and Docker instructions.

## Getting Started

### 1. Access the code

We recommend forking this repository under your account (or the [stjude-dnb-binfcore](https://github.com/stjude-dnb-binfcore) organization for core projects), then cloning your fork:

```
git clone https://github.com/<YOUR_FORK>/sc-spatial-transcriptomics.git
cd sc-spatial-transcriptomics
```

Keep your fork’s `main` branch in sync with `stjude-dnb-binfcore/sc-spatial-transcriptomics:main` when updates are published. If you later add a project-specific `project_parameters.Config.yaml`, commit or stash local changes before pulling upstream updates.

### 2. Set up the analysis environment

From the repository root on HPC or locally:

- **Interactive RStudio (HPC):** `bash run-rstudio.sh`
- **Interactive shell in the container (HPC):** `bash run-terminal.sh`

Full steps (Singularity pull, bind mounts, Docker) are in [run-container/README.md](run-container/README.md).

### 3. Run analysis modules

When modules are available, each will live under `analyses/<module_name>/` with its own `README.md` and entry script (for example `run-<module>.sh`). See [analyses/README.md](analyses/README.md) for the recommended module order and descriptions.

## How to Use This Repository

| Step | Action |
|------|--------|
| Environment | Follow [run-container/README.md](run-container/README.md) |
| Parameters | *(Coming soon)* `project_parameters.Config.yaml` at repo root |
| Metadata | *(Coming soon)* example layout under `data/project_metadata` |
| Figures | Shared palettes and theme: [figures/README.md](figures/README.md) |
| Full pipeline | *(Coming soon)* `launch_full_pipeline.sh` |

For HPC resource guidance (queues, memory), St. Jude users can refer to the [Introduction to the HPCF cluster](https://wiki.stjude.org/display/HPCF/Introduction+to+the+HPCF+cluster#IntroductiontotheHPCFcluster-queuesQueues:) wiki, adjusting memory for cohort size and spatial data type.

## Repository Layout

Current structure (modules and config files will expand over time):

```
sc-spatial-transcriptomics/
├── analyses/              # Analysis modules (see analyses/README.md)
├── figures/               # Plot theme and color palettes
├── run-container/         # Container documentation (HPC + Docker)
├── run-rstudio.sh         # Start RStudio via Singularity on HPC
├── run-terminal.sh        # Start a shell in the same container
├── LICENSE
├── README.md
├── SECURITY.md
└── package.json
```

**Related repositories**

- [sc-rna-seq-snap](https://github.com/stjude-dnb-binfcore/sc-rna-seq-snap) — sc/snRNA-seq workflow (reference layout and interim container)
- [devops-containers](https://github.com/stjude-dnb-binfcore/devops-containers/tree/main/analyses/sc-rna-seq/run-container) — container build context (scRNA-Seq SNAP image used until spatial-specific packages are finalized)

## Planned Additions

The following SNAP-style components are planned for this repository:

- `project_parameters.Config.yaml` — paths, metadata, and module-specific defaults
- `data/project_metadata/` — example `project_metadata.tsv` for spatial cohorts
- `launch_full_pipeline.sh` — optional end-to-end execution with LSF toggles
- Named modules under `analyses/` (documented in [analyses/README.md](analyses/README.md))
- Dedicated spatial container definition in devops-containers when R package requirements are settled

## Authors

Antonia Chroni, PhD ([@AntoniaChroni](https://github.com/AntoniaChroni))  
Felipe Segato Dezem, PhD ([@ximbao](https://github.com/ximbao))  
Maycon Marção, Msc ([@Mmaycon](https://github.com/Mmaycon))

## Contact

Contributions, issues, and feature requests are welcome. Please use [GitHub Issues](https://github.com/stjude-dnb-binfcore/sc-spatial-transcriptomics/issues).

---

*These tools and pipelines have been developed by the Bioinformatics core team and Center for Spatial Omics at [St. Jude Children's Research Hospital](https://www.stjude.org/). These are open access materials distributed under the terms of the [BSD 2-Clause License](https://opensource.org/license/bsd-2-clause), which permits unrestricted use, distribution, and reproduction in any medium, provided the original author and source are credited.*
