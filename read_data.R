# read_data.R
# Here we assume that the data that is read in has annotation in the first 3 columns,
# with the probe id in the first, the chr in the second and the location in the third
# The remaining columns are assumed to contain sample data only, and the column names
# of those are used to check if they are in the same order

# Also: we transform chr into numeric, with "X" and "Y" replaced by 23 and 24, respectively
# We do assume that start is numeric

my.study <- "sources5"

source("read_snpCNdata.R")

source("read_GEdata.R")

source("read_methdata.R")
