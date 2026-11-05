#################################################################################
# Run all scripts in the module
#################################################################################
# Load library
suppressPackageStartupMessages({
  library(yaml)})
#################################################################################
# load config file
configFile <- paste0("../../project_parameters.Config.yaml")
if (!file.exists(configFile)) {
  cat("\n Error: configuration file not found:", configFile)
  stop("Exit...")}

# read `yaml` file defining the `params` of the project and strategy analysis
yaml <- read_yaml(configFile)
#################################################################################
# Set up directories and paths to root_dir and analysis_dir
root_dir <- yaml$root_dir
analysis_dir <- file.path(root_dir, "analyses", "data-exploratory-analysis-sc-spatial-Visium-parse")
report_dir <- file.path(analysis_dir, "plots")
if (!dir.exists(report_dir)) {
  dir.create(report_dir)}

################################################################################################################
# Run Rmd scripts
################################################################################################################
rmarkdown::render("01-data-exploratory-analysis.Rmd", clean = TRUE,
                              output_dir = file.path(report_dir),
                              output_file = c(paste("Report-", "data-exploratory-analysis-sc-spatial-Visium-parse-", Sys.Date(), sep = "")),
                              output_format = "html_document",
                              params = list(
                                # the following parameters are defined in the `yaml` file
                                 root_dir = yaml$root_dir,
                                 metadata_dir_parse = yaml$metadata_dir_parse,
                                 metadata_file = yaml$sample_loading_table_metadata_file,
                                 input_dir_parse = yaml$raw_input_dir_parse,
                                 keep_columns = yaml$keep_columns_sample,
                                 PROJECT_NAME = yaml$PROJECT_NAME_parse,
                                 PI_NAME = yaml$PI_NAME_parse,
                                 TASK_ID = yaml$TASK_ID,
                                 PROJECT_LEAD_NAME = yaml$PROJECT_LEAD_NAME,
                                 DEPARTMENT = yaml$DEPARTMENT,
                                 LEAD_ANALYSTS = yaml$LEAD_ANALYSTS_parse,
                                 GROUP_LEAD = yaml$GROUP_LEAD,
                                 CONTACT_EMAIL = yaml$CONTACT_EMAIL,
                                 PIPELINE = yaml$PIPELINE,
                                 START_DATE = yaml$START_DATE,
                                 COMPLETION_DATE = yaml$COMPLETION_DATE))
################################################################################################################
