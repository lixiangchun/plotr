% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/plot_extra.R
\name{polyShade}
\alias{polyShade}
\title{Polygon shading}
\usage{
polyShade(x, y, from, to, n = 50, miny, ...)
}
\arguments{
\item{x, y}{x- and y-values from the curve}

\item{from}{a vector of x-coordinates \emph{from} which to color}

\item{to}{a vector of x-coordinates \emph{to} which to color (same length)
as \code{from}}

\item{n}{tuning parameter for fitting the shading region to the curve; a
lower value will result in a worse fit around the curve}

\item{miny}{by default, shading will extend from the curve to \code{min(y)}}

\item{...}{additional parameters passed to \code{\link{polygon}}; common
uses are \code{density} for shading lines, \code{col} for shading color(s),
\code{border} for border color, or \code{lty} for line type}
}
\description{
Color or shade the area under a curve.
}
\examples{
set.seed(1)
x <- c(rnorm(75), rnorm(25, 5))
plot(xx <- density(x), panel.first = {
  polyShade(xx$x, xx$y, from = c(min(xx$x), 6), to = c(-2, max(xx$x)),
            col = adjustcolor('red', .3), border = NA)
})

polyShade(xx$x, xx$y, -1, 2, col = 'red', border = NA)
polyShade(xx$x, xx$y, 0, 4, col = 'blue', density = 20, lty = 4, 
          miny = par('usr')[1], border = NA)

}
\seealso{
\url{http://www.fromthebottomoftheheap.net/2013/01/11/shading-regions-under-a-curve/}
}

