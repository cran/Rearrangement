\name{plot.conint}
\alias{plot.conint}
\title{
Plot Method for Simultaneous Confidence Intervals
}
\description{
A method for the \code{\link[graphics]{plot}} generic. It graphs both the upper and lower end-point functions of a confidence interval as an unfilled polygon.
}

\usage{
\method{plot}{conint}(x, border, col, \dots)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
    \item{x}{object of class \code{conint}}
  \item{border, col}{same usage as in \code{\link[graphics]{polygon}}}
	\item{\dots}{further arguments to \code{\link[graphics]{plot.default}}}
}
\details{
This is intended for plotting confidence intervals produced by the output of \code{\link{simconboot}} or \code{\link{rconint}}.
}


\author{
Wesley Graybill, Mingli Chen, Victor Chernozhukov, Ivan Fernandez-Val, Alfred Galichon
}

\seealso{
\code{\link[graphics]{plot}}, \code{\link{lines.conint}}, \code{\link{points.conint}}
}
\examples{
data(GrowthChart)
attach(GrowthChart)

nage <- 2 * pi * (age - min(age)) / (max(age) - min(age))
formula <- height ~ I(sin(nage))+I(cos(nage))+I(sin(2*nage))+I(cos(2*nage))+I(sin(3*nage))+I(cos(3*nage))+I(sin(4*nage))+I(cos(4*nage))
j<-simconboot(nage,height,lm,formula)
plot(j)
points(nage,height)

detach(GrowthChart)
}

\keyword{ device }
