year <- c(1985,1995,2005)
y1 <- c(64220, 61776, 63252)
y2 <- c(10066, 10113, 10562)
y3 <- c(54154, 51662, 52689)

par(mar=c(5,5,4,1)+.1)

{
plot(1,type='n',xlim=c(1,3),ylim=c(0,70000),xlab="", ylab = expression(paste("Grassland Area (km"^"2",")")), xaxt="n")
xtick<-seq(1, 3, by=1)
axis(side=1, at=xtick, labels = FALSE)
text(x=xtick,  labels= c("1985", "1995", "2005"), 
     par("usr")[3], srt = 0, pos = 1, xpd = TRUE)


lines(y1, type="b", col="green",lwd=2)
lines(y2, type="b", lty=2, col="red")
lines(y3, type="b", lty=2, col="blue")

legend(2.35, 38000,legend=c("Total Study Area","Non-Protected Areas", 
                            "Protected Areas"), col=c("green","blue", "red"), lty=c(1,2,2), lwd=c(2,1,1))
}






