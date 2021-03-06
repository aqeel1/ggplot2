% Generated by roxygen2 (4.1.1): do not edit by hand
% Please edit documentation in R/geom-segment.r
\name{geom_segment}
\alias{geom_segment}
\title{Single line segments.}
\usage{
geom_segment(mapping = NULL, data = NULL, stat = "identity",
  position = "identity", arrow = NULL, lineend = "butt", na.rm = FALSE,
  show_guide = NA, ...)
}
\arguments{
\item{mapping}{The aesthetic mapping, usually constructed with
\code{\link{aes}} or \code{\link{aes_string}}. Only needs to be set
at the layer level if you are overriding the plot defaults.}

\item{data}{A data frame. If specified, overrides the default data frame
defined at the top level of the plot.}

\item{stat}{The statistical transformation to use on the data for this
layer, as a string.}

\item{position}{Postion adjustment, either as a string, or the result of
a call to a position adjustment function.}

\item{arrow}{specification for arrow heads, as created by arrow()}

\item{lineend}{Line end style (round, butt, square)}

\item{na.rm}{If \code{FALSE} (the default), removes missing values with
a warning.  If \code{TRUE} silently removes missing values.}

\item{show_guide}{logical. Should this layer be included in the legends?
\code{NA}, the default, includes if any aesthetics are mapped.
\code{FALSE} never includes, and \code{TRUE} always includes.}

\item{...}{other arguments passed on to \code{\link{layer}}. There are
  three types of arguments you can use here:

  \itemize{
  \item Aesthetics: to set an aesthetic to a fixed value, like
     \code{color = "red"} or \code{size = 3}.
  \item Other arguments to the layer, for example you override the
    default \code{stat} associated with the layer.
  \item Other arguments passed on to the stat.
  }}
}
\description{
Single line segments.
}
\section{Aesthetics}{

\Sexpr[results=rd,stage=build]{ggplot2:::rd_aesthetics("geom", "segment")}
}
\examples{
library(grid) # needed for arrow function
p <- ggplot(seals, aes(x = long, y = lat))
(p <- p + geom_segment(aes(xend = long + delta_long, yend = lat + delta_lat),
  arrow = arrow(length = unit(0.1,"cm"))))

if (require("maps")) {

xlim <- range(seals$long)
ylim <- range(seals$lat)
usamap <- data.frame(map("world", xlim = xlim, ylim = ylim, plot =
FALSE)[c("x","y")])
usamap <- rbind(usamap, NA, data.frame(map('state', xlim = xlim, ylim
= ylim, plot = FALSE)[c("x","y")]))
names(usamap) <- c("long", "lat")

p + geom_path(data = usamap) + scale_x_continuous(limits = xlim)
}

# You can also use geom_segment to recreate plot(type = "h") :
counts <- as.data.frame(table(x = rpois(100,5)))
counts$x <- as.numeric(as.character(counts$x))
with(counts, plot(x, Freq, type = "h", lwd = 10))

ggplot(counts, aes(x, Freq)) +
  geom_segment(aes(xend = x, yend = 0), size = 10)#'
# Adding line segments
library(grid) # needed for arrow function
b <- ggplot(mtcars, aes(wt, mpg)) + geom_point()
b + geom_segment(aes(x = 2, y = 15, xend = 2, yend = 25))
b + geom_segment(aes(x = 2, y = 15, xend = 3, yend = 15))
b + geom_segment(aes(x = 5, y = 30, xend = 3.5, yend = 25),
   arrow = arrow(length = unit(0.5, "cm")))
}
\seealso{
\code{\link{geom_path}} and \code{\link{geom_line}} for multi-
  segment lines and paths.
}

