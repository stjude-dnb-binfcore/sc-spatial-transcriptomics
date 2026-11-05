####################################################################################################
#' Function to add metadata columns that are common to sample and sublibrary metadata tables
#' Takes input of a metadata table for sample metadata or sublibrary metadata for a project
#' @param metadata
#'
#' @return
create_common_columns <- function(metadata) {
  is_visium <- project_id %in% c("Tuyu_SRM846531", "Dyer_SRM854274", "Kennedy_SRM848935")

  if (is_visium) {
    return(add_column(
      metadata,
      project = project_id,
      data_type = NA_character_,
      seq_technology = NA_character_,
      kit = NA_character_,
      chemistry = NA_character_,
      PI = NA_character_,
      PROJECT_LEAD_NAME = NA_character_
    ))
  }

  metadata <- add_column(metadata,
                         project = project_id,
                         data_type = "snRNAseq",
                         seq_technology = "Parse",
                         kit = "WT",
                         chemistry = "v3",
                         PI = "Zakharenko",
                         PROJECT_LEAD_NAME = "Kristen Thomas") %>%
    mutate(data_type = case_when(grepl("Otx2_SE2", project_id) ~ "scRNAseq",
                                 TRUE ~ data_type),
           kit = case_when(grepl("Df1_22q11_DS|LgDel", project_id) ~ "WT_mega",
                           grepl("Pilot", project_id) ~ "WT_mini",
                           TRUE ~ kit),
           chemistry = case_when(grepl("Pilot", project_id) ~ "v2",
                                 TRUE ~ chemistry),
           PI = case_when(grepl("CDK6|G34R", project_id) ~ "Han",
                          grepl("Otx2_SE", project_id) ~ "Dyer",
                          TRUE ~ PI),
           PROJECT_LEAD_NAME = case_when(grepl("CDK6", project_id) ~ "Neha Sarodaya",
                                         grepl("G34R", project_id) ~ "Kris Olesen",
                                         grepl("Otx2_SE", project_id) ~ "Mellisa Clemons",
                                         TRUE ~ PROJECT_LEAD_NAME))
  return(metadata)
}
