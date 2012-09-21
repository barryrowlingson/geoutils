smoother <- function(g){
### smooth graph by removing degree=2 vertices
###

  ## label the vertices
  g = set.vertex.attribute(g,name="ID",value=paste("V",1:length(V(g)),sep=""))

  ## find all degree-2 vertices
  twos = V(g)[degree(g)==2]

  ## subgraph with only those
  subG = induced.subgraph(g,twos)

  ## now we're going to delete all these nodes.
  ## but we're going to add edges between the bits on the end of each string-of-pearls

  strings = clusters(subG)
  for(i in 1:strings$no){
    string = V(subG)[strings$membership == i]
    ends = V(subG)[strings$membership == i & degree(subG)==1]

    if(length(ends)!=2){
      warning("short cluster")
      next
    }
    
    endNeighs = c(neighbors(g,V(g)[ends$name[1]]),neighbors(g,V(g)[ends$name[2]]))
    endDegree = degree(g,endNeighs)
    endPoints = V(g)[endNeighs[endDegree!=2]]$name
    # now we have the new edge points
    g = add.edges(g,endPoints)
    g = delete.vertices(g,string$name)
  }
  g
}
