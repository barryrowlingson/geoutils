makeNest <- function(n) {
    ### generate a bunch of SpatialLines on (0,1) square
    xy = cbind(runif(n), runif(n), runif(n), runif(n))
    lines = Lines(apply(xy, 1, function(z) {
        Line(rbind(z[1:2], z[3:4]))
    }), ID = 1)
    SpatialLines(list(lines))
}
