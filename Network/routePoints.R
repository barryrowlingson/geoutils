routePoints <- function(graph, from, to) {
    require(FNN)
    xyg = cbind(V(graph)$x, V(graph)$y)

    ifrom = get.knnx(xyg, from, 1)$nn.index[1, 1]
    ito = get.knnx(xyg, to, 1)$nn.index[1, 1]

    p = get.shortest.paths(graph, ifrom, ito, output = "vpath")
    p[[1]]
}
