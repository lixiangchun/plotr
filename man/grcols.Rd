% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/plot_extra.R
\name{grcols}
\alias{grcols}
\title{Choose n colors using the golden ratio}
\usage{
grcols(n, s = 0.5, v = 1, alpha = 1)
}
\arguments{
\item{n}{number of colors}

\item{s, v}{numeric vectors of values in the range \code{[0, 1]} for 
"saturation" and "value," respectively, to be combined to form a vector of
colors; values in shorter arguments are recycled}

\item{alpha}{numeric vector of values in the range \code{[0, 1]} for alpha 
transparency channel (0 is transparent and 1 is opaque)}
}
\description{
This chooses \code{n} colour hues using a sequence generated by the Golden
Ratio.
}
\examples{
plot(1:5, 1:5, col = grcols(5), pch = 20, cex = 3)

plot(c(1, 6), c(0, 1), type = 'n', axes = FALSE, 
     bty = 'n', xlab = '', ylab = '')
rect(1:5, 0, 2:6, 1, col = grcols(5), border = NA)

}
\seealso{
\code{\link{hsv}}
}

