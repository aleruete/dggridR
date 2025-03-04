% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/dggridR.R
\name{dgshptogrid}
\alias{dgshptogrid}
\title{Return boundary coordinates for cells intersecting a
                 shapefile}
\usage{
dgshptogrid(
  dggs,
  shpfname,
  cellsize = 0.1,
  frame = TRUE,
  wrapcells = TRUE,
  savegrid = NA
)
}
\arguments{
\item{dggs}{A dggs object from dgconstruct()}

\item{shpfname}{File name of the shapefile. Filename should end with '.shp'}

\item{cellsize}{Distance, in degrees, between the sample points used to
generate the grid. Small values yield long generation times
while large values may omit cells.}

\item{frame}{If TRUE, return a data frame suitable for ggplot plotting.
If FALSE, return an OGR poly object}

\item{wrapcells}{Cells which cross -180/180 degrees can present
difficulties for plotting. Setting this TRUE will result in
cells with components in both hemispheres to be mapped
entirely to positive degrees (the Eastern hemisphere). As a
result, such cells will have components in the range
[180,360). Only used when \code{frame=TRUE}.}

\item{savegrid}{If savegrid is set to a file path, then a shapefile
containing the grid is written to that path and the filename
is returned. No other manipulations are done.
Default: NA (do not save grid, return it)}
}
\value{
Returns a data frame or OGR poly object, as specified by \code{frame}.
        If \code{!is.na(savegrid)}, returns a filename.
}
\description{
Returns the coordinates constituting the boundary of a
                 set of cells which intersect or are contained by a polygon
                 (or polygons) specified in a shapefile. Note that grid cells
                 are also generated for holes in the shapefile's polygon(s).

                 Note that coordinates in the shapefile must be rounded to
                 check polygon intersections. Currently this round preserves
                 eight decimal digits of precision.

                 The eighth decimal place is worth up to 1.1 mm of precision:
                 this is good for charting the motions of tectonic plates and
                 the movements of volcanoes. Permanent, corrected,
                 constantly-running GPS base stations might be able to
                 achieve this level of accuracy.

                 In other words: you should be just fine with this level of
                 precision.
}
\examples{
library(dggridR)

dggs <- dgconstruct(spacing=25, metric=FALSE, resround='nearest')
south_africa_grid <- dgshptogrid(dggs,dg_shpfname_south_africa())
}
