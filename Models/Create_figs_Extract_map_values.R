#### Extract data for maps
# Load libraries and import cell-specific coordinates and if within Central Africa forest region
library(rstan)
coords<-read.csv("Data/forest_cells.csv")
# Load calculated spatial uncertainty values
spatial_uncertainty<-read.csv("Data/spatial_uncertainty_values.csv")
# Load functions to wrap-up data
source("R_code/extract_values.R")
source("R_code/extract_uncertainty.R")

#### 1) Extract predicted values for final model: ####
# 1) consumption rates; 2) consumed biomass; 
# 3) proportion protein; 4) difference in consumed bioamss
M_final <- readRDS("Results/M_final.RDS")
predictions<-(extract_values(M=M_final,coords=coords))
write.csv(predictions,"Results/predictions_M_final.csv")
# Extract uncertainty values for final model
predictions_unc<-extract_uncertainty(M=M_final,coords=coords,spatial=spatial_uncertainty)
write.csv(predictions_unc,"Results/predictions_uncertainty_M_final.csv")

#### 2) Extract predicted values for final model: ####
# 1) consumption rates; 2) consumed biomass; 
# 3) proportion protein; 4) difference in consumed bioamss
M_2LT <- readRDS("Results/M_2_location_types.RDS")
names(M_2LT)[20]<-"kilos_consumed"
predictions<-extract_values(M=M_2LT,coords=coords)
write.csv(predictions,"Results/predictions_M_2_location_types.csv")
# Extract uncertainty values for final model
prediction_unc<-extract_uncertainty(M=M_2LT,coords=coords,spatial=spatial_uncertainty)
write.csv(predictions_unc,"Results/predictions_uncertainty_M_2_location_types.csv")
