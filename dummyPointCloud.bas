REM SmallBASIC
REM created: 17/05/2021

IMPORT PointCloud

pc = PointCloud.createFromFile("grafo.pg")

v = PointCloud.voronoi(pc)
d = PointCloud.delaunai(pc)
h = PointCloud.convexHull(pc)

PointCloud.displayAsRaster(pc)
PointGraph.displayAsRaster(v)
PointGraph.displayAsRaster(d)
PointList.displayAsRaster(h)

END
