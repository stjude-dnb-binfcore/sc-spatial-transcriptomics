# Visium cohort checklist (exploratory module)

Complete before adding a cohort to `loading_paths_by_project.tsv` or running Space Ranger.

1. **Lab metadata** — Filled `wetlab_metadata_<SRM>.csv` under `input/project-metadata/`, or analyst-signed FASTQ/cmdline stub (Dyer-style).
2. **Species** — Record `human` or `mouse`; must match `transcriptome` and `probe-set` in Space Ranger config.
3. **Raw TSVs** — `input/raw/project/<ProjectKey>/metadata/sublibrary_metadata.tsv` and `sample_metadata.tsv`.
4. **Index row** — `loading_paths_by_project.tsv` points at the module copy of the wet lab CSV.
5. **Space Ranger snapshot** — `spaceranger_<ProjectKey>.yaml` (paths only; optional for Rmd today).
6. **Downstream yaml** — Set `project_parameters.Config.yaml` genome profile to match the cohort you will analyze (see commented profiles in that file).
