# get all lakes >=2e5 m^2
water = joinLR(lakesP,riversP,2e5)
g = makeG(water)

plot(dem2)
lines(water)

xy = cbind(V(g)$x,V(g)$y)

z=extract(dem2,xy)

V(g)$z=z

