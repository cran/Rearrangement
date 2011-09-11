\name{simconboot}
\alias{simconboot}
\title{
Simultaneous Confidence Interval Estimation using Bootstrap
}
\description{
\code{simconboot} obtains a simultaneous confidence interval for a function. It estimates the lower and upper endpoint functions of the interval by bootstrap.
}
\usage{
simconboot(x,y,estimator,formula,B=200,alpha=0.05,sampsize=length(x),seed=8,colInt=c(5:39)/2,...)
}
\arguments{
  \item{x}{a numerical vector of x values}
  \item{y}{a numerical vector of y values}
  \item{estimator}{estimator to be used in regression}
  \item{formula}{formula to be used in the estimator}
  \item{B}{an integer with the number of bootstrap repetitions}
  \item{alpha}{a real number between 0 and 1 reflecting the desired confidence level}
  \item{sampsize}{an integer with the sample size of each bootstrap repetition}
  \item{seed}{if desired, seed to be set for the random number generator}
  \item{colInt}{the points to be evaluated when ploting}
  \item{\dots}{further arguments to be passed to the estimator}
}
\details{
\code{estimator} can be any of a set of standard regression models, most commonly \code{\link[stats]{lm}} or \code{\link[quantreg]{rq}} (from package \pkg{quantreg})  for global
estimators and the built-in functions \code{\link{lclm}}, \code{\link{lplm}}, \code{\link{lcrq2}}, \code{\link{lprq2}} for local estimators. 

Note: formula=0 for all the local estimators.
}
\value{
  An object of class \code{conint} with the following elements:
  \item{x}{the original x data}
  \item{y}{the original y data}
  \item{sortedx}{the original x data, sorted with repeated elements removed}
  \item{Lower}{the lower endpoint function. Represented as a vector of values corresponding to sortedx}
  \item{Upper}{the upper endpoint function. Represented as a vector of values corresponding to sortedx}
  \item{cef}{the corresponding estimates}
}


\author{
Wesley Graybill, Mingli Chen, Victor Chernozhukov, Ivan Fernandez-Val, Alfred Galichon
}

\seealso{
\code{\link{rconint}}
}

\examples{
data(GrowthChart)
attach(GrowthChart)

nage <- 2 * pi * (age - min(age)) / (max(age) - min(age))
nages <- unique(sort(nage))
formula <- height~I(sin(nage))+I(cos(nage))+I(sin(2*nage))+I(cos(2*nage))+I(sin(3*nage))+I(cos(3*nage))+I(sin(4*nage))+I(cos(4*nage))
j <- simconboot(nage,height,lm,formula)
plot(j, border=NA, col='darkgray',xlab = 'Age (years)',ylab = 'Height (cms)',xaxt = "n")
axis(1, at = seq(-2*pi*min(age)/(max(age)-min(age)), 2*pi+1, by=5*2*pi/(max(age)-min(age))), label = seq(0, max(age)+1, by=5))
points(nage,height)
lines(nages, j$cef, lty=2, col='green')

detach(GrowthChart)
}

\keyword{ regression }
\keyword{ models }