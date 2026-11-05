####################################################################################################
#' Function to add metadata columns that are common to sample and sublibrary metadata tables
#' Takes input of a metadata table for sample metadata or sublibrary metadata for a project
#' @param metadata
#'
#' @return
create_common_columns <- function(metadata) {
  # Add metadata columns for sequencing technology info and project info
  metadata <- add_column(metadata,
                         project = project_id,
                         data_type = "snRNAseq",
                         seq_technology = "Parse",
                         kit = "WT",
                         chemistry = "v3",
                         PI = "Zakharenko",
                         PROJECT_LEAD_NAME = "Kristen Thomas") %>%
    
    # Update column values as needed for specific projects
    # Mellisa's project (Otx2_SE2) was single cell
    mutate(data_type = case_when(grepl("Otx2_SE2", project_id) ~ "scRNAseq",
                                 TRUE ~ data_type),
           
           # Update kit: Kristen's pilot data was a mini kit, Kristen's other project were mega kits
           kit = case_when(grepl("Df1_22q11_DS|LgDel", project_id) ~ "WT_mega",
                           grepl("Pilot", project_id) ~ "WT_mini",
                           TRUE ~ kit),
           
           # Update chemistry: Kristen's pilot data was v2
           chemistry = case_when(grepl("Pilot", project_id) ~ "v2",
                                 TRUE ~ chemistry),
           
           # Update PI
           PI = case_when(grepl("CDK6|G34R", project_id) ~ "Han",
                          grepl("Otx2_SE", project_id) ~ "Dyer",
                          TRUE ~ PI),
           
           # Update project biologist
           PROJECT_LEAD_NAME = case_when(grepl("CDK6", project_id) ~ "Neha Sarodaya",
                                         grepl("G34R", project_id) ~ "Kris Olesen",
                                         grepl("Otx2_SE", project_id) ~ "Mellisa Clemons",
                                         TRUE ~ PROJECT_LEAD_NAME))
  # Returned updated metadata object
  return(metadata)
}
