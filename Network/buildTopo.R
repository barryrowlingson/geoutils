buildTopo <- function(lines) {

    g = gIntersection(lines, lines)
    edges = do.call(rbind, lapply(g@lines[[1]]@Lines, function(ls) {
        as.vector(t(ls@coords))
    }))
    lengths = sqrt((edges[, 1] - edges[, 3])^2 + (edges[, 2] - edges[, 4])^2)

    froms = paste(edges[, 1], edges[, 2])
    tos = paste(edges[, 3], edges[, 4])

    graph = graph.edgelist(cbind(froms, tos), directed = FALSE)
    E(graph)$weight = lengths

    xy = do.call(rbind, strsplit(V(graph)$name, " "))

    V(graph)$x = as.numeric(xy[, 1])
    V(graph)$y = as.numeric(xy[, 2])
    return(graph)
}
