######################################################################
#
# Download raw data from Peisker et al, 2022
#
# File comea from one location: GEO
#
######################################################################

# set paths based on configuration file
system("source ~/.research_config")

# load libraries
library(RCurl)
library(R.utils)

### define URLs to download the data from ###

# URL for raw data on GEO
geo_url = "https://www.ncbi.nlm.nih.gov/geo/download/?acc=GSM5070696&format=file&file=GSM5070696%5FCdh5%5FTAC%5Fmolecule%5Finfo%2Eh5"

### create directories for raw data ###

raw_data_dir = sprintf("%sraw", .get_config_path("LOCAL_PEISKER_2022_DATA_DIR"))
if(dir.exists(raw_data_dir)) stop("Raw data directory already exists!")

### download raw data from GEO ###

filename = "GSM5070696_Cdh5_TAC_molecule_info.h5"
source = geo_url
dest = sprintf("%s/%s", raw_data_dir, filename)

# download
cat(sprintf("Downloading h5 file from GEO...\n"))
download.file(source, dest)

cat(sprintf("Done!\n"))