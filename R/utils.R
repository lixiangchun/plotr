### utils
# plotr_utils, %ni%, %inside%, %||%, tcol, rescaler
#
# polar-cartesian utils: d2r, r2d, p2c, c2p, p2r, p2d
###


#' plotr utils
#' 
#' Some utilities for \code{plotr}.
#' 
#' \code{\%ni\%} is the negation of \code{\link[base]{\%in\%}}.
#' 
#' \code{\%inside\%} returns a logical vector indicating if \code{x} is inside
#' the \code{interval} (inclusive).
#' 
#' \code{\%||\%} is useful for a function, \code{f}, that may return a value
#' or \code{NULL}, but if \code{NULL} is the result of \code{f}, it is
#' desirable to return some other default value without errors.
#' 
#' \code{tcol} adds transparency to colors (vectorized).
#' 
#' @param x vector or \code{NULL}; the values to be matched
#' @param table vector or \code{NULL}; the values to be matched against
#' @param interval numeric vector of length two representing the interval
#' @param a,b raw, logical, "number-like" vectors or objects
#' @param color vector of color names (or hexadecimal)
#' @param trans transparency defined as an integer in the range 
#' \code{[0, 255]} where \code{0} is fully transparent and \code{255} is fully
#' visible
#' 
#' @aliases oror %||% notin %ni% inside %inside% tcol
#' @seealso \code{\link{\%in\%}}, \code{\link{||}}
#' @name plotr_utils
#' 
#' @examples
#' \dontrun{
#' 1:5 %ni% 3:5
#' 
#' c(0,4) %inside% c(0, 4)
#' -5:5 %inside% c(0,5)
#' -5:5 %inside% c(5,0)
#' 
#' f <- function(x0 = TRUE) NULL || x0
#' f() # error
#' f <- function(x0 = TRUE) NULL %||% x0
#' f() # TRUE
#' 
#' cols <- c('red','green','blue')
#' 
#' # a normal plot
#' plot(rnorm(100), col = tcol(cols), pch = 16, cex = 4)
#' 
#' # more transparent
#' plot(rnorm(100), col = tcol(cols, 100), pch = 16, cex = 4)
#' 
#' # hexadecimal colors also work
#' cols <- c('#FF0000','#00FF00','#0000FF')
#' plot(rnorm(100), col = tcol(cols, c(50, 100, 255)), pch= 16, cex = 4)
#' }
NULL

#' @rdname plotr_utils
#' @export
'%ni%' <- function(x, table) !(match(x, table, nomatch = 0) > 0)

#' @rdname plotr_utils
#' @export
'%inside%' <- function(x, interval) {
  interval <- sort(interval)
  x >= interval[1] & x <= interval[2]
}

#' @rdname plotr_utils
#' @export
'%||%' <- function(a, b) if (!is.null(a)) a else b

#' @rdname plotr_utils
#' @export
tcol <- function(color, trans = 255) {
  if (length(color) != length(trans) & 
        !any(c(length(color), length(trans)) == 1)) 
    stop('Vector lengths not correct')
  if (length(color) == 1 & length(trans) > 1) 
    color <- rep(color, length(trans))
  if (length(trans) == 1 & length(color) > 1) 
    trans <- rep(trans, length(color))
  res <- paste0('#', apply(apply(rbind(col2rgb(color)), 2, function(x) 
    format(as.hexmode(x), 2)), 2, paste, collapse = ''))
  res <- unlist(unname(Map(paste0, res, as.character(as.hexmode(trans)))))
  res[is.na(color)] <- NA
  return(res)
}

## rawr::rescaler
rescaler <- function(x, to = c(0, 1), from = range(x, na.rm = TRUE)) {
  zero_range <- function (x, tol = .Machine$double.eps * 100) {
    if (length(x) == 1) return(TRUE)
    if (length(x) != 2) stop('\'x\' must be length one or two')
    if (any(is.na(x)))  return(NA)
    if (x[1] == x[2])   return(TRUE)
    if (all(is.infinite(x))) return(FALSE)
    m <- min(abs(x))
    if (m == 0) return(FALSE)
    abs((x[1] - x[2]) / m) < tol
  }
  if (zero_range(from) || zero_range(to))
    return(rep(mean(to), length(x)))
  (x - from[1]) / diff(from) * diff(to) + to[1]
}

## convert degrees to radians or vice versa
d2r <- function(degrees = 1) degrees * (pi / 180)
r2d <- function(radians = 1) radians * (180 / pi)

## convert polar to cartesian or vice versa
p2c <- function(radius, theta, degree = FALSE) {
  # p2c(c2p(0, 1)$r, c2p(0, 1)$t)
  if (degree)
    theta <- d2r(theta)
  list(x = radius * cos(theta),
       y = radius * sin(theta))
}
c2p <- function(x, y, degree = FALSE) {
  # c2p(p2c(1, 30, TRUE)$x, p2c(1, 30, TRUE)$y, TRUE)
  list(radius = sqrt(x ** 2 + y ** 2),
       theta = atan2(y, x) * if (degree) r2d() else 1)
}

## x,y coords to radians/degrees
p2r <- function(x, y, cx = 0, cy = 0) {
  # p2r(0,1)
  atan2(y - cy, x - cx)
  # ifelse(r < 0, pi / 2 + abs(r), r)
}
p2d <- function(x, y, cx = 0, cy = 0) {
  # p2d(0,1)
  r2d(atan2(y - cy, x - cx))
}
