joinLR <- function(lakes,rivers,lakesize){

  area = gArea(lakes,byid=TRUE)
  lakes = lakes[area>lakesize,]
  lakelines = as(lakes,"SpatialLines")
  water = gUnion(lakelines,rivers)
  return(water)
}

makeG <- function(water){
  return(buildTopo(water))
}
