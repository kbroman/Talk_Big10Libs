library(here)
library(broman)
purple <- broman::brocolors("web")["purple"]
blue <- broman::brocolors("web")["blue"]
green <- broman::brocolors("web")["green"]
red <- broman::brocolors("web")["red"]


pdf(here("Figs/timeline.pdf"), height=6, width=9.5, pointsize=16)
par(bty="n", mar=rep(0,4))
plot(0,0,type="n", xaxt="n", yaxt="n", xlab="", ylab="",
     xaxs="i", yaxs="i", xlim=c(1992-1/2, 2023), ylim=c(0,100))
y <- 80
yh <- 5
rect(1992+1/12, y-yh, 1997-1/12, y+yh, col=purple, border=purple, lend="round")
text((1992+1997)/2, y, "grad school", col="white")

rect(1997+1/12, y-yh, 1999-1/12, y+yh, col=blue, border=blue, lend="round")
text(1998, y, "postdoc", col="white", cex=0.7)

rect(1999+1/12, y-yh, 2007-1/12, y+yh, col=green, border=green, lend="round")
text((1999+2007)/2, y, "johns hopkins", col="white")

rect(2007+1/12, y-yh, 2023-1/2, y+yh, col=red, border=red, lend="round")
text((2007+2023)/2, y, "u wisconsin-madison", col="white")

dev.off()
