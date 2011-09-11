\name{polygon.conint}
\alias{polygon.conint}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
polygon Method for Simultaneous Confidence Intervals
}
\description{
\code{polygon.conint} graphs both the upper and lower end-point functions of a confidence interval as a standard polygon on a plot.
}
\usage{
polygon.conint(x, ...)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{x}{object of class \code{conint}}
  \item{\dots}{further arguments to \code{\link[graphics]{polygon}}}
}

\details{
This is intended for plotting confidence intervals produced by the output of \code{\link{simconboot}} or \code{\link{rconint}}.

}

\author{
Wesley Graybill, Mingli Chen, Victor Chernozhukov, Ivan Fernandez-Val, Alfred Galichon
}

\seealso{
\code{\link[graphics]{polygon}}
}
\examples{
data(GrowthChart)
attach(GrowthChart)

nage <- 2 * pi * (age - min(age)) / (max(age) - min(age))
formula <- height~I(sin(nage))+I(cos(nage))+I(sin(2*nage))+I(cos(2*nage))+I(sin(3*nage))+I(cos(3*nage))+I(sin(4*nage))+I(cos(4*nage))
j<-simconboot(nage,height,lm,formula)
plot(nage,height,pch=21,bg='gray',cex=0.5,xlab="Age (years)",ylab="Height (cms)",col='gray',xaxt='n')
axis(1, at = seq(-2*pi*min(age)/(max(age)-min(age)), 2*pi+1,by=5*2*pi/(max(age)-min(age))), label = seq(0, max(age)+1, by=5))
polygon.conint(j, border=NA, col='darkgray')

detach(GrowthChart)
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ aplot }
