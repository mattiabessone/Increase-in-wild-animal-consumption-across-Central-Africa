extract_uncertainty<-function(M,coords,spatial){
  
  sd_rates<-matrix(NA,nrow=874,ncol=3)
  for (i in 1:874){
    sd_rates[i,1]<-sd(M$consumption_rates[,i,1])
    sd_rates[i,2]<-sd(M$consumption_rates[,i,2])
    sd_rates[i,3]<-sd(M$consumption_rates[,i,3])
  }
  
  # Extract standard deviation of predicted consumed biomass for each cell
  sd_biomass<-matrix(NA,nrow=874,ncol=3)
  for (i in 1:874){
    sd_biomass[i,1]<-sd(M$kilos_consumed[,i,1])
    sd_biomass[i,2]<-sd(M$kilos_consumed[,i,2])
    sd_biomass[i,3]<-sd(M$kilos_consumed[,i,3])
  } 
  
  predictions_unc<-as.data.frame(cbind(coords,sd_rates,sd_biomass,spatial_uncertainty$difference_rec))
  names(predictions_unc)<-c("cell_ID","CA_forest","x","y",
                               "sd_rates_past","sd_rates_recent","sd_rates_present",
                               "sd_biomass_past","sd_biomass_recent","sd_biomass_present",
                               "spatial_uncertainty")
}
