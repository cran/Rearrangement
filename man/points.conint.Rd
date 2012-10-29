\name{points.conint}
\alias{points.conint}

\title{
Points Method for Simultaneous Confidence Intervals

}
\description{
A method for the \code{\link[graphics]{points}} generic. It graphs both the upper and lower end-point functions of a confidence interval as points on a plot.

}
\usage{
\method{points}{conint}(x, \dots)
}

\arguments{
  \item{x}{object of class \code{conint}}
  \item{\dots}{further arguments to \code{\link[graphics]{points.default}}} 
}

\details{
This is intended for plotting confidence intervals produced by the output of \code{\link{simconboot}} or \code{\link{rconint}}.
}

\author{
Wesley Graybill, Mingli Chen, Victor Chernozhukov, Ivan Fernandez-Val, Alfred Galichon
}

\seealso{
\code{\link[graphics]{points}}, \code{\link{plot.conint}}, \code{\link{lines.conint}}
}
\examples{
data(GrowthChart)
attach(GrowthChart)

nage <- 2 * pi * (age - min(age)) / (max(age) - min(age))
formula<-height~I(sin(nage))+I(cos(nage))+I(sin(2*nage))+I(cos(2*nage))+I(sin(3*nage))+I(cos(3*nage))+I(sin(4*nage))+I(cos(4*nage))
j <- simconboot(nage,height,lm,formula)
plot(nage,height,pch=21,bg='gray',cex=.5,xlab="Age (years)",ylab="Height (cms)",col="gray")
points(j)

detach(GrowthChart)
}

\keyword{aplot}
