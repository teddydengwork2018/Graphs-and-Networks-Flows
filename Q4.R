closeAllConnections()
rm(list=ls())

#Question 4

library('igraph')
library('readr')

nw_data = read.delim("Movie_greater_10_Weight.txt",sep = ",",header=FALSE,stringsAsFactors = FALSE)
colnames(nw_data) = c("movie 1", "movie 2", "Weights") 
nw1_fin = graph.data.frame(nw_data,directed = FALSE)

