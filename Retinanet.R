library(tidyverse)
library(gtable)
library(grid)
library(plotly)
library(lubridate)
library(magrittr)
library(gridExtra)
library(ggforce)
library(kableExtra)
library(leaflet)
library(rlang)
library(scales)
library(gridtext)


RRT <- read_excel("Behavior Detection/pytorch-retinanet/RRT.xlsx")

plot1 <- ggplot(RRT, aes(x =Epochs, y =ClassificationLoss)) + 
  geom_line(size = 2)+ geom_point(color = "black", size = 1) + 
  scale_y_continuous(breaks = seq(0, 0.6, 0.1)) +
  xlab('') + ylab('') + labs(title= "Classification Loss") + 
  theme(axis.text.x=element_text(angle = 45, hjust = 0.5)) + theme_classic() + 
  theme(axis.text = element_text(size=12)) + theme(axis.text = element_text(size=12))

plot2 <- ggplot(RRT, aes(x = Epochs, y = RegressionLoss)) + 
  geom_line(size = 2)+ geom_point(color = "black", size = 1) + 
  scale_y_continuous(breaks = seq(0, 0.6, 0.1))+
  xlab('') + ylab('') + labs(title= "Regression Loss") + 
  theme(axis.text.x=element_text(angle = 45, hjust = 0.5)) + theme_classic()+ 
  theme(axis.text = element_text(size=12)) + theme(axis.text = element_text(size=12))

plot3 <- ggplot(RRT, aes(x = Epochs, y = RunningLoss)) + 
  geom_line(size = 2)+ geom_point(color = "black", size = 1) + 
  scale_y_continuous(breaks = seq(0., 1, 0.1)) +
  xlab('') + ylab('') + labs(title= "Running Loss") + 
  theme(axis.text.x=element_text(angle = 45, hjust = 0.5)) + theme_classic()+ 
  theme(axis.text = element_text(size=12)) + theme(axis.text = element_text(size=12))

grid.arrange(plot1,
             plot2,
             plot3,
             nrow=1,
             bottom = textGrob("Epochs", rot = 0, vjust = 0, gp=gpar(fontface = 6, fontsize = 16)),
             left = textGrob("Loss", rot = 90, vjust = 1, gp=gpar(fontface = 6, fontsize = 16)),
             top = textGrob("RetinaNet Training", gp=gpar(fontface = 7, fontsize = 20))
)

mAP<- ggplot(RRT, aes(x =Epochs, y =mAP)) + 
  geom_line(size = 2)+ geom_point(color = "black", size = 1) + 
  scale_y_continuous(breaks = seq(0, 1, 0.2)) +
  xlab('Epochs') + ylab('mAP') + labs(title= "Mean Average Precision") + 
  theme(axis.text.x=element_text(angle = 45, hjust = 0.5)) + theme_classic() + 
  theme(axis.text = element_text(size=12)) + theme(axis.text = element_text(size=12))
mAP

m1<- ggplot(RY05, aes(x =Epochs, y =mAP)) + 
  geom_line(size = 2)+ geom_point(color = "black", size = 1) + 
  scale_y_continuous(breaks = seq(0, 0.6, 0.1)) +
  xlab('') + ylab('') + labs(title= "YOLOv5") + 
  theme(axis.text.x=element_text(angle = 45, hjust = 0.5)) + theme_classic() + 
  theme(axis.text = element_text(size=12)) + theme(axis.text = element_text(size=12))
m2 <- ggplot(RY07, aes(x =Epochs, y =mAP)) + 
  geom_line(size = 2)+ geom_point(color = "black", size = 1) + 
  scale_y_continuous(breaks = seq(0, 0.6, 0.1)) +
  xlab('') + ylab('') + labs(title= "YOLOv7") + 
  theme(axis.text.x=element_text(angle = 45, hjust = 0.5)) + theme_classic() + 
  theme(axis.text = element_text(size=12)) + theme(axis.text = element_text(size=12))
m3 <- ggplot(RRT, aes(x =Epochs, y =mAP)) + 
  geom_line(size = 2)+ geom_point(color = "black", size = 1) + 
  scale_y_continuous(breaks = seq(0.3, 0.8, 0.05)) +
  xlab('') + ylab('') + labs(title= "RetinaNet") + 
  theme(axis.text.x=element_text(angle = 45, hjust = 0.5)) + theme_classic() + 
  theme(axis.text = element_text(size=12)) + theme(axis.text = element_text(size=12))

grid.arrange(m1,
             m2,
             m3,
             nrow=1,
             bottom = textGrob("Epochs", rot = 0, vjust = 0, gp=gpar(fontface = 6, fontsize = 16)),
             left = textGrob("mAP", rot = 90, vjust = 1, gp=gpar(fontface = 6, fontsize = 16)),
             top = textGrob("Comparision of Different Deep Learning Architechture", gp=gpar(fontface = 7, fontsize = 20))
)


summary(RRT)
