## Load Required Packages

install.packages("imager")
install.packages("colordistance")
install.packages("countcolors")
install.packages("png")
install.packages("jpeg")
library("imager")
library("countcolors")
library("colordistance")
library("png")
library("jpeg")


## Visualise Image 

plot_jpeg = function(path, add=FALSE)
{
  require('jpeg')
  jpg = readJPEG(path, native=T)     # read the file
  res = dim(jpg)[2:1]                # get the resolution, [x, y]
  if (!add)                          # initialize an empty plot area if add==FALSE
    plot(1,1,xlim=c(1,res[1]),ylim=c(1,res[2]),asp=1,type='n',xaxs='i',yaxs='i',xaxt='n',yaxt='n',xlab='',ylab='',bty='n')
  rasterImage(jpg,1,1,res[1],res[2])
}
plot_jpeg("filepath to image")


## Produce Colour Density Histogram

picture <- loadImage("C:\\Users\\bever\\OneDrive\\Documents\\MastersProject\\Pictures(TreeSquares)\\B2NP_2018.jpg",
                     lower=c(0.9,0.9,0.9), upper=c(1,1,1))                                       # loads the image, excluding the white background
binnedtest <- getImageHist(picture, bins=4, bin.avg=TRUE, plotting=TRUE, hsv=FALSE, title="")    # produces colour density histogram with 64 bins
binnedtest                                                                                       # displays proportion of pixels within each bin


## Visually Validate Bins

ewan <- readJPEG("filepath to image")
sphericalRange(ewan, c(0.1956803, 0.1192569, 0.07420088), 0.25, target.color = "magenta",        # recolours all the pixels in the colour space within a 0.25 radius of specified RGB values corresponding to tree cover 
               main = "", color.pixels = TRUE, plotting = TRUE)


## Graphical and Statistical Analysis of Tree Cover

treecover <- read.csv("D:\\rtreecover.csv")                # reads in tree cover data
treecover$fprotected <- as.factor(treecover$protected)     # set protected status as a factor (Y or N)

protectedarea <- treecover[treecover$protected=="Y",]      # creates dataframe with data for protected areas
noprotectedarea <- treecover[treecover$protected=="N",]    # creates dataframe with data for non-protected areas

boxplot(treecover$firstcover, treecover$secondcover, protectedarea$firstcover, protectedarea$secondcover,    # creates boxplot of % tree cover at each time point for the whole study area, protected and non-protected areas 
        noprotectedarea$firstcover, noprotectedarea$secondcover, col=c("darkolivegreen1","darkolivegreen4"), 
        ylab="% Tree Cover",ylim=c(0,30))
legend("topright",legend=c("2003", "2018"), 
       col=c("darkolivegreen1","darkolivegreen4"), lty=c(1,1), lwd=10)

treecover$logdiff <- log10(treecover$difference+6.29)      # log10-transforms 'difference' after adding 6.29 constant to account for negative values
treecoverlm <- lm(logdiff ~ fprotected, data=treecover)    # applies linear model for the effect of protected status on lo10difference
summary(treecoverlm)
anova(treecoverlm)


