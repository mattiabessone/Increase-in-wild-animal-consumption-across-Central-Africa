extract_values<-function(M,coords){
  # Extract mean consumption rate for each cell
  rates<-matrix(NA,nrow=874,ncol=3)
  for (i in 1:874){
    rates[i,1]<-mean(M$consumption_rates[,i,1])
    rates[i,2]<-mean(M$consumption_rates[,i,2])
    rates[i,3]<-mean(M$consumption_rates[,i,3])
  } 
  
  # Extract mean consumed biomass for each cell
  biomass<-matrix(NA,nrow=874,ncol=3)
  for (i in 1:874){
    biomass[i,1]<-mean(M$kilos_consumed[,i,1])
    biomass[i,2]<-mean(M$kilos_consumed[,i,2])
    biomass[i,3]<-mean(M$kilos_consumed[,i,3])
  }
  
  # Calculate and extract proportion of wild meat supplied
  p_protein<-matrix(NA,nrow=874,ncol=3)
  for (i in 1:874){
    p_protein[i,1]<-rates[i,1]*0.7*0.294
    p_protein[i,2]<-rates[i,2]*0.7*0.294
    p_protein[i,3]<-rates[i,3]*0.7*0.294
  }
  
  # Calculate and extract difference in consumed biomass for each cells
  d_biomass<-vector(length=874)
  for (i in 1:874){
    d_biomass[i]<-mean(M$kilos_consumed[,i,2]-M$kilos_consumed[,i,1])
  } 
  
  predictions<-as.data.frame(cbind(coords,rates,biomass,p_protein,d_biomass))
  names(predictions)<-c("cell_ID","CA_forest","x","y",
                        "rates_past","rates_recent","rates_present",
                        "biomass_past","biomass_recent","biomass_present",
                        "protein_past","protein_recent","protein_present",
                        "d_biomass")
  return(predictions)
}
