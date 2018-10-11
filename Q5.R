
# clearing workspace
closeAllConnections()
rm(list=ls())

library('igraph')
library('readr')

############## Question 4 ##############
cat("\n \n ############## Question 4 ############## \n")

Graph.data = read.delim("Movie_greater_10_Weight.txt",sep = ",",header=FALSE,stringsAsFactors = FALSE) #generate from Q4.py
colnames(Graph.data) = c("Node 1", "Node 2", "weights")
g1 = graph.data.frame(Graph.data,directed = FALSE)

g1_simple = simplify(g1,remove.loops = FALSE,edge.attr.comb = "first") #remove multiple edges


############## Question 5 ##############
cat("\n \n ############## Question 5 ############## \n")

# read in movies & genres  
movie_genre = read.delim("processed_genre.txt" ,sep = "\t",header = FALSE,stringsAsFactors = FALSE)

colnames(movie_genre) = c("movie","genre")
movies = as.vector(movie_genre$movie)

genre_master = as.vector(unique(movie_genre$genre)) #create vector mapping genre to a specific index

comm_struct = fastgreedy.community(g1_simple, weights = E(g1_simple)$weights)

memberships = comm_struct$membership 
num_coms = length(unique(memberships)) 

tot_comm_genres = matrix(list(),num_coms,2)
for(i in 1:num_coms){
  cat('Analyzing Community', i , 'of', num_coms,'\n')
  
    # get all movies in community i   
  idx = which(memberships == i) # indicies of nodes in community i
  comm_movies = V(g1_simple)$name[idx]                  
  
    # get all genres of movies in community i
  matches = match( comm_movies, movies , nomatch = 0 )
  matches = matches[ which(matches != 0)]
  comm_genres = movie_genre$genre[matches]
  
    #get master idx of each genre in community i
  genre_idx = table(match(comm_genres,genre_master)) 
  
  thresh = length(comm_movies)*0.2 # set 20% threshold
  
  ps_thresh = which(genre_idx >= thresh) # which indicies occured more than 20% of the time
  comm_20_genres = genre_master[as.numeric(names(ps_thresh))] # convert idx back to actual genre names
  if(length(comm_20_genres) == 0){
    comm_20_genres = "None greater than 20%"
  }
  tot_comm_genres[[i,1]] = comm_20_genres # community genre
  tot_comm_genres[[i,2]] = length(idx) # number of each movie in a community
  cat('     Community', i, 'genres: ',comm_20_genres,'number mov',length(idx),'\n')
}
