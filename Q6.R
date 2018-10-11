
# clearing workspace
closeAllConnections()
rm(list=ls())

library('igraph')
library('readr')

##Question 6

Graph.data = read.delim("Movie_greater_10_Weight.txt",sep = ",",header=FALSE,stringsAsFactors = FALSE) #generate from Q4.py
colnames(Graph.data) = c("Node 1", "Node 2", "weights")
g1 = graph.data.frame(Graph.data,directed = FALSE)

g1_simple = simplify(g1,remove.loops = FALSE,edge.attr.comb = "first") #remove multiple edges

comm_struct = fastgreedy.community(g1_simple, weights = E(g1_simple)$weights)

memberships = comm_struct$membership 
num_coms = length(unique(memberships)) 

nodes = V(g1_simple)$name # all nodes names in g1_simple graph


##BAT
movie_name_bat = "89967"

batman = which(nodes == movie_name_bat)
batman_comm = comm_struct$membership[batman]
batman_neighbors = as.vector(neighbors(g1_simple , batman , mode = "all"))


batman_nvec = numeric()
for( i in batman_neighbors){
  batman_nvec = c(batman_nvec,batman,i)
}

batman_edge_ids = get.edge.ids(g1_simple,batman_nvec,directed = FALSE) 
batman_edge_weights = E(g1_simple , directed = FALSE)$weights[batman_edge_ids] 
sorted_weights = sort(batman_edge_weights , decreasing = TRUE , index.return = TRUE)


batman_5NN_idx = batman_edge_ids[sorted_weights$ix[1:5]]
batman_5NN_pairs = ends(g1_simple,batman_5NN_idx) 
batman_5NN_names = batman_5NN_pairs[which(batman_5NN_pairs != movie_name_bat)]

# Print
cat(movie_name_bat," is in community # ",batman_comm ,"\n")

cat("The 5 Nearest neightbors of \",movie_name_bat, "\\n")
cat(batman_5NN_names[1]," with weight ",sorted_weights$x[1],"\n")
cat(batman_5NN_names[2]," with weight ",sorted_weights$x[2],"\n")
cat(batman_5NN_names[3]," with weight ",sorted_weights$x[3],"\n")
cat(batman_5NN_names[4]," with weight ",sorted_weights$x[4],"\n")
cat(batman_5NN_names[5]," with weight ",sorted_weights$x[5],"\n")


##Mission  
movie_name_misimp = "11059"

misimp = which(nodes == movie_name_misimp)
misimp_comm = comm_struct$membership[misimp]
misimp_neighbors = as.vector(neighbors(g1_simple , misimp , mode = "all"))

misimp_nvec = numeric()
for( i in misimp_neighbors){
  misimp_nvec = c(misimp_nvec,misimp,i)
}

misimp_edge_ids = get.edge.ids(g1_simple,misimp_nvec,directed = FALSE) # get all edges ids with misimp nodes
misimp_edge_weights = E(g1_simple , directed = FALSE)$weights[misimp_edge_ids] # get corresponding weights
sorted_weights = sort(misimp_edge_weights , decreasing = TRUE , index.return = TRUE)


misimp_5NN_idx = misimp_edge_ids[sorted_weights$ix[1:5]]
misimp_5NN_pairs = ends(g1_simple,misimp_5NN_idx) # outputs a matrix
misimp_5NN_names = misimp_5NN_pairs[which(misimp_5NN_pairs != movie_name_misimp)]

# Print
cat(movie_name_misimp, "\ is in community # ",misimp_comm,"\n \n")

cat("The 5 Nearest neightbors of \",movie_name_misimp,"\\n")
cat(misimp_5NN_names[1]," with weight ",sorted_weights$x[1],"\n")
cat(misimp_5NN_names[2]," with weight ",sorted_weights$x[2],"\n")
cat(misimp_5NN_names[3]," with weight ",sorted_weights$x[3],"\n")
cat(misimp_5NN_names[4]," with weight ",sorted_weights$x[4],"\n")
cat(misimp_5NN_names[5]," with weight ",sorted_weights$x[5],"\n")


##Minions
movie_name_minions = "130839"

minions = which(nodes == movie_name_minions) 
minions_comm = comm_struct$membership[minions] 
minions_neighbors = as.vector(neighbors(g1_simple , minions , mode = "all"))

minions_nvec = numeric()
for( i in minions_neighbors){
  minions_nvec = c(minions_nvec,minions,i)
}

minions_edge_ids = get.edge.ids(g1_simple,minions_nvec,directed = FALSE)
minions_edge_weights = E(g1_simple , directed = FALSE)$weights[minions_edge_ids] 
sorted_weights = sort(minions_edge_weights , decreasing = TRUE , index.return = TRUE)

minions_5NN_idx = minions_edge_ids[sorted_weights$ix[1:5]]
minions_5NN_pairs = ends(g1_simple,minions_5NN_idx) # outputs a matrix
minions_5NN_names = minions_5NN_pairs[which(minions_5NN_pairs != movie_name_minions)]

# Print
cat(movie_name_minions, "\ is in community # ",minions_comm,"\n \n")
cat("The 5 Nearest neightbors of \",movie_name_minions,"\\n")
cat(minions_5NN_names[1]," with weight ",sorted_weights$x[1],"\n")
cat(minions_5NN_names[2]," with weight ",sorted_weights$x[2],"\n")
cat(minions_5NN_names[3]," with weight ",sorted_weights$x[3],"\n")
cat(minions_5NN_names[4]," with weight ",sorted_weights$x[4],"\n")
cat(minions_5NN_names[5]," with weight ",sorted_weights$x[5],"\n")
