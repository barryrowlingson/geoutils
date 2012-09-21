plotRoute <- function(graph, nodes, ...) {
    lines(V(graph)[nodes]$x, V(graph)[nodes]$y, ...)
}
