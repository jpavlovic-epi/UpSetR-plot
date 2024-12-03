###Clear all from global enviroment
rm(list = ls(all.names = TRUE)) #will clear all objects includes hidden objects
gc() #free up memrory

###Install Venn's diagram package and UpSetR
#install.packages("VennDiagram")
#install.packages("UpSetR")
#install.packages("extrafont")


###Load packages
library(UpSetR)
library(VennDiagram)
library(ggplot2)
library(gridExtra)
library(gridBase)
library(grid)
library(plyr)
library(devtools)
library(extrafont)
library(extrafontdb)
loadfonts(device = "win")
library(conflicted)
library(ggpubr)             #ggarrange(example, example, ncol = 2, labels = c("A", "B"))
library(tiff)

###Setting the directory
setwd("C:/Users/ik/Desktop/2020/project NTpro-BNP/Tables")


###UpSetR graph for better visualization
input <- c(
  "MEGA" = 1575,
  "MEGA&JUPITER" = 12,
  "MEGA&HOPE-3" = 294,
  "MEGA&JUPITER&HOPE-3" = 15,
  "JUPITER" = 232,
  "JUPITER&HOPE-3" = 308,
  "HOPE-3" = 670,
  "Not trial eligible" = 2328
)

upset(fromExpression(input), 
      nintersects = NA, 
      nsets = 4,
      sets = c("MEGA","JUPITER","HOPE-3","Not trial eligible"),
      keep.order = TRUE,
      group.by = "sets", 
      order.by = "freq",
      show.numbers = "yes",
      sets.bar.color = c("mediumpurple2","turquoise3","deeppink3","grey40"),
      main.bar.color = c("mediumpurple2","mediumpurple2","mediumpurple2","mediumpurple2",
                         "turquoise3","turquoise3","turquoise3","turquoise3",
                         "deeppink3","deeppink3","deeppink3","deeppink3",
                         "grey40"),
      matrix.color = "grey57",
      decreasing = TRUE,
      mb.ratio = c(0.6, 0.4),
      number.angles = 0, 
      text.scale = 1.1,
      point.size = 2.8,
      line.size = 1,
      sets.x.label = "RCT size",
      mainbar.y.label = "Trial eligiblity and intersection size (n)"
)

###Save plot as tiff
tiff(filename = "NT-proBNP UpSetR 20210423.tiff", 
     units = "in", 
     width = 9.5, height = 8, 
     res = 300, compression = "lzw")
dev.off()


