
library(bibliometrix)  #load the package
library(pander)  #other required packages
library(knitr)
library(kableExtra)
library(ggplot2)
library(bibliometrixData)



data <- read.csv('Bibliometric_Analysis/data/Total.csv')
colnames(data)
levels(as.factor(data$Date.of.Export))



data("scientometrics")
# Descriptive analysis
M = scientometrics  #just to reuse the other code
res1 = biblioAnalysis(M, sep = ";")
s1 = summary(res1, k = 10, pause = FALSE, verbose = FALSE)

d1 = s1$MainInformationDF  #main information 
d2 = s1$MostProdAuthors  #Most productive Authors 
d3 = s1$MostCitedPapers  #most cited papers 
pander(d1, caption = "Summary Information")


pander(d3, caption = "Most Cited Papers")


p1 = plot(res1, pause = FALSE)

library(ggplot2)
theme_set(theme_bw())


p1[[1]] + theme_bw() + scale_x_discrete(limits = rev(levels(as.factor(p1[[1]]$data$AU))))

p1[[2]]

threeFieldsPlot(M, fields = c("DE", "AU", "AU_CO"))

Map = thematicMap(M, field = "ID", n = 1000, minfreq = 5, stemming = FALSE, size = 0.5,
                  n.labels = 4, repel = TRUE)
plot(Map$map)