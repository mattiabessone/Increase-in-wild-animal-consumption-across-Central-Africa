M<-M_final
par(oma=c(0,1,0,2),mar=c(3.5,3,1,0.5),cex=2,bty="n")
# Drivers
a1<-c()
b1<-c()
for(i in 1:4000) a1[i]<-mean(M$a1[i,])
for(i in 1:4000) b1[i]<-mean(M$b1[i,])

dat<-as.data.frame(cbind(a1,M$a3,M$a2,M$a4))
dat1<-as.data.frame(cbind(b1,M$b3,M$b2,M$b4))
stripchart(dat,xlim=c(-2,2),col="skyblue",pch=16,cex=0.2,yaxt="n",ylim=c(0.5,4),xlab="",cex.lab=1.5,method="jitter",jitter=0.05,xaxt="n")
stripchart(dat1,xlim=c(-2,2),col="lightcoral",pch=16,cex=0.2,yaxt="n",ylim=c(0.5,3),at=c(0.5,1.5,2.5,3.5),method="jitter",jitter=0.05,add=TRUE)
abline(v=0,lwd=2,lty=3)
abline(h=seq(1.25,4.25,1),lwd=1,lty=1,col="grey60")
axis(side=2,at=seq(0.75,3.75,1),labels=c("HPD","HDI","REM","FCI"),tck=-0,las=1,cex=3,lwd=3)
axis(side=1,at=seq(-2,2,1),labels=c("-2","-1","0","1","2"),cex.lab=0.9,las=1,lwd = 3)
segments(x0=c(HPDI(dat[,1])[1],HPDI(dat[,2])[1],HPDI(dat[,3])[1],HPDI(dat[,4])[1])
         ,x1=c(HPDI(dat[,1])[2],HPDI(dat[,2])[2],HPDI(dat[,3])[2],HPDI(dat[,4])[2])
         ,y0=c(1,2,3,4),y1=c(1,2,3,4),col="royalblue4",lwd=3)
points(x=c(mean(dat[,1]),mean(dat[,2]),mean(dat[,3]),mean(dat[,4])),y=c(1,2,3,4)
       ,pch=18,col="royalblue4")
segments(x0=c(HPDI(dat1[,1])[1],HPDI(dat1[,2])[1],HPDI(dat1[,3])[1],HPDI(dat1[,4])[1])
         ,x1=c(HPDI(dat1[,1])[2],HPDI(dat1[,2])[2],HPDI(dat1[,3])[2],HPDI(dat1[,4])[2])
         ,y0=c(1,2,3,4)-0.5,y1=c(1,2,3,4)-0.5,col="darkorchid4",lwd=3)
points(x=c(mean(dat1[,1]),mean(dat1[,2]),mean(dat1[,3]),mean(dat1[,4])),y=c(1,2,3,4)-0.5
       ,pch=18,col="darkorchid4")
mtext("Effect",side=1,adj=0.5,cex=2.5,line=2.5)

