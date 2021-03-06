% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/plot_extra.R
\name{click_shape}
\alias{click_shape}
\title{Add shapes interactively in base \code{R} graphics}
\usage{
click_shape(shape = "line", col = "black", border = col, corners = 5,
  lty = par("lty"), lwd = par("lwd"), density = NULL, length = 1,
  code = 2, ...)
}
\arguments{
\item{shape}{type of shape; choices are \code{'box'}, \code{'arrow'},
\code{'line'}, \code{'poly'}, \code{'circle'}, and \code{'cyl'}}

\item{col}{shape outline color}

\item{border}{border colour for shape; defaults to value for \code{col}}

\item{corners}{number of corners to draw for a polygon}

\item{lty, lwd}{graphical parameters; see \code{\link{par}}}

\item{density}{the density of shading lines in lines per inch; the default
value of \code{NULL} means that no shading lines are drawm; a zero value of
\code{density} means no shading or filling, whereas negative values and 
\code{NA} suppress shading (and so allow color filling)}

\item{length}{length of the edges of the arrow head (in inches); see 
\code{\link{arrows}}}

\item{code}{integer code for 'arrows' determining \emph{kind} of arrows to 
be drawn}

\item{...}{ignored}
}
\description{
Add shapes anywhere in a plot (including margins) with mouse click(s).
}
\examples{
\dontrun{
plot.new()
click_shape() # a line segment
click_shape('arrow', col = 'blue', code = 2, lwd = 2, length = .15)
click_shape('box', border = 'purple', col = 'pink', lwd = 2)
click_shape('box', col = NULL, border = 'purple', lwd = 2)
click_shape('line', col = 'orange', lty = 3, lwd = 3)
click_shape('poly', corners = 5, border = 'green', col = 'orange')
click_shape('poly', corners = 3, border = 'red', col = 'yellow', lty = 1)
click_shape('cyl', col = 'orange')
click_shape('circle', col = 'orange', border = 'black', lty = 3, lwd = 3)
}

}
\seealso{
\code{\link{click_text}}, \code{link{tcol}}, \code{\link{rect}},
\code{\link{arrows}}, \code{\link{rect}}, \code{\link{rect}},
\code{\link{segments}}, \code{\link{polygon}},
\code{\link[plotrix]{draw.circle}}, \code{\link[plotrix]{cylindrect}}
}

