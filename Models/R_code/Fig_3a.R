###Fig 3a ###
M <- M_final
predictions <- read.csv("Data/predictions.csv")
lt<-predictions$loc_type
CAf<-predictions$CA_forest

# Extract consumption rate posterior distributions for villages, town and cities
temp<-M$consumption_rates[,lt==1 & CAf==1,2]
cr_vill<-temp[,1]
for (i in 1:(dim(temp)[2]-1)){
  cr_vill<-append(cr_vill,temp[,i])
}

temp<-M$consumption_rates[,lt==2 & CAf==1,2]
cr_town<-temp[,1]
for (i in 1:(dim(temp)[2]-1)){
  cr_town<-append(cr_town,temp[,i])
}

temp<-M$consumption_rates[,lt==3 & CAf==1,2]
cr_city<-temp[,1]
for (i in 1:(dim(temp)[2]-1)){
  cr_city<-append(cr_city,temp[,i])
}

# Plot
par(cex=1.5,bty="n",mar=c(3,4,1,1))
boxplot(cr_vill*1000,outline=FALSE,xlim=c(0,3),at=0.5,ylab="g/AME/day",border="tomato3",lwd=4,col="transparent",las=1)
boxplot(cr_town*1000,outline=FALSE,xlim=c(0,3),at=1.5,add=TRUE,border="palegreen3",lwd=4,col="transparent",yaxt="n")
boxplot(cr_city*1000,outline=FALSE,xlim=c(0,3),at=2.5,add=TRUE,border="skyblue2",lwd=4,col="transparent",yaxt="n")
points(x=c(0.5,1.5,2.5),y=c(mean(cr_vill,na.rm=T)*1000,mean(cr_town,na.rm=T)*1000,mean(cr_city,na.rm=T)*1000),pch=c(16,18,15),cex=1.8,col=c("tomato3","palegreen3","skyblue2"))
axis(side=1,at=c(0.5,1.5,2.5),labels =  c("Village","Town","City"),tck=-0.015,las=1)

