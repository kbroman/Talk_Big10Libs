timeline <-
    function(version=6)
{


library(here)
library(broman)
darkblue <- "#003262"
blue <- broman::brocolors("web")["blue"]
green <- broman::brocolors("web")["green"]
red <- broman::brocolors("web")["red"]
gray <- broman::brocolors("web")["gray"]
orange <- broman::brocolors("web")["orange"]

if(version==6) {
    pdf(here("Figs/timeline.pdf"), height=5.2, width=9.5, pointsize=16)
} else {
    pdf(here(paste0("Figs/timeline", version, ".pdf")), height=5.2, width=9.5, pointsize=16)
}


par(bty="n", mar=rep(0,4))
plot(0,0,type="n", xaxt="n", yaxt="n", xlab="", ylab="",
     xaxs="i", yaxs="i", xlim=c(1987.5, 2023), ylim=c(7,100-7))
y <- 80
yh <- 5
rect(1988+1/12, y-yh, 1992-1/12, y+yh, col=orange, border=orange, lend="round")
text((1988+1992)/2, y, "undergrad", col="white")

rect(1992+1/12, y-yh, 1997-1/12, y+yh, col=darkblue, border=darkblue, lend="round")
text((1992+1997)/2, y, "grad school", col="white")

rect(1997+1/12, y-yh, 1999-1/12, y+yh, col=green, border=green, lend="round")
text(1998, y, "postdoc", col="white", cex=0.6)

rect(1999+1/12, y-yh, 2007-1/12, y+yh, col=blue, border=blue, lend="round")
text((1999+2007)/2, y, "johns hopkins", col="white")

rect(2007+1/12, y-yh, 2023-1/2, y+yh, col=red, border=red, lend="round")
text((2007+2023)/2, y, "u wisconsin-madison", col="white")

x <- c(1988, 1992, 1997, 1999, 2007)
segments(x, y+yh+1, x, y+yh*1.25+1, lwd=2, lend=1, ljoin=1)

xpos <- c(1/2, 0,0,0,0)
text(x+xpos, y+yh*1.5+1, x, adj=c(0.5,0))

# ae genetics: 2004 - 2010
# se genetics 2016 - 2021
# ae PeerJ 2017-2019
# ae JASA 2006-2009
# ae biostatistics 2004-2007
# BMC Biology 2016-2021

#  AE genetics / se genetics
#  ae biostat  / ae peerj
#       ae jasa / BMC biology

y <- y - yh*2.1
yh <- yh*0.7
rect(2004-1/2, y-yh, 2010+1/2, y+yh, col=gray, border=gray, lend="round")
text((2004+2010)/2, y, "ae genetics", col="white")

rect(2016-1/2, y-yh, 2021, y+yh, col=gray, border=gray, lend="round")
text((2016+2021)/2, y, "se genetics", col="white")

y <- y-yh*1.6
arrowh <- yh*1.5

if(version > 1) {
arrows(1996, y-arrowh, 1996, y, len=0.1, lwd=2)
text(1996, y-arrowh*1.3, "1996\nJ Stat Soft", adj=c(0.5, 1))

x <- 1991
yadj <- 0
arrows(x, y-arrowh-yadj, x, y-yadj, len=0.1, lwd=2)
text(x, y-arrowh*1.3-yadj, "1991\narXiv", adj=c(0.5, 1))
}

if(version > 2) {
x <- 2001
yadj <- arrowh*3.2

arrows(x, y-arrowh-yadj, x, y-yadj, len=0.1, lwd=2)
text(x, y-arrowh*1.3-yadj, "2001\nCreative\nCommons", adj=c(0.5, 1))

x <- 2003
yadj <- 0
arrows(x, y-arrowh-yadj, x, y-yadj, len=0.1, lwd=2)
text(x, y-arrowh*1.3-yadj, "2003\nPLOS Biology", adj=c(0.5, 1))
}

if(version > 3) {
x <- 2007
yadj <- arrowh*3.2
arrows(x, y-arrowh-yadj, x, y-yadj, len=0.1, lwd=2)
text(x, y-arrowh*1.3-yadj, "2007\nNIH policy on\nPubMed Central", adj=c(0.5, 1))

arrows(2008, y-arrowh, 2008, y, len=0.1, lwd=2)
text(2008, y-arrowh*1.3, "2008\nBeall's List", adj=c(0.5, 1))
}

if(version > 4) {
x <- 2013
yadj <- 0
arrows(x, y-arrowh-yadj, x, y-yadj, len=0.1, lwd=2)
text(x, y-arrowh*1.3-yadj, "2013\nbioRxiv", adj=c(0.5, 1))

x <- 2012
yadj <- arrowh*3.2
arrows(x, y-arrowh-yadj, x, y-yadj, len=0.1, lwd=2)
text(x, y-arrowh*1.3-yadj, "2012\nPeerJ\n& eLife", adj=c(0.5, 1))

x <- 2013
yadj <- arrowh*7
arrows(x, y-arrowh-yadj, x, y-yadj, len=0.1, lwd=2)
text(x, y-arrowh*1.3-yadj, "2013\nU California\nOA policy", adj=c(0.5, 1))
}

if(version > 5) {
x <- 2016
yadj <- arrowh*3.2
arrows(x, y-arrowh-yadj, x, y-yadj, len=0.1, lwd=2)
text(x, y-arrowh*1.3-yadj, "2016\nPsyArXiv", adj=c(0.5, 1))

x <- 2019
yadj <- 0
arrows(x, y-arrowh-yadj, x, y-yadj, len=0.1, lwd=2)
text(x, y-arrowh*1.3-yadj, "2019\nmedRxiv\n& EdArXiv", adj=c(0.5, 1))
}

dev.off()
}

# create the pdfs
for(version in 1:6) {
    timeline(version)
}
