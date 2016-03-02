\name{rconint}
\alias{rconint}
\title{Rearrangement of Simultaneous Confidence Intervals}
\description{Uses \code{\link{rearrangement}} to apply the rearrangement operator to objects of class \code{conint}.}
\usage{
rconint(x, n = 100, stochastic = FALSE, avg = TRUE)
}

\arguments{
  \item{x}{object of class \code{conint}}
  \item{n}{an integer denoting the number of sample points desired}
  \item{stochastic}{logical. If TRUE, stochastic sampling will be used}
  \item{avg}{logical. If TRUE, the average rearrangement will be computed and outputed}
}
\details{
Implements the rearrangement operator of \code{\link{rearrangement}} on simultaneous confidence intervals. Intended for use on output of \code{\link{simconboot}}.

}
\value{
 An object of class \code{conint} with the following elements:
  \item{x}{the original x data}
  \item{y}{the original y data}
  \item{sortedx}{the original x data, sorted with repeated elements removed}
  \item{Lower}{the rearranged lower end-point function. Represented as a vector of values corresponding to sortedx}
  \item{Upper}{the rearranged upper end-point function. Represented as a vector of values corresponding to sortedx}
  \item{cef}{the corresponding estimates}
}
\references{
Chernozhukov, V., I. Fernandez-Val, and a. Galichon. 2009. Improving point and interval estimators of monotone functions by rearrangement. Biometrika 96 (3): 559-575. 

Chernozhukov, V., I. Fernandez-Val, and a. Galichon. 2010. Quantile and Probability Curves Without Crossing. Econometrica 78(3): 1093-1125.

}
\author{
Wesley Graybill, Mingli Chen, Victor Chernozhukov, Ivan Fernandez-Val, Alfred Galichon

}

\seealso{
\code{\link{simconboot}}, \code{\link{rearrangement}}
}
\examples{
\dontrun{
data(GrowthChart)
attach(GrowthChart)

nage <- 2 * pi * (age - min(age)) / (max(age) - min(age))
formula <- height ~ I(sin(nage))+I(cos(nage))+I(sin(2*nage))+I(cos(2*nage))+
            I(sin(3*nage))+I(cos(3*nage))+I(sin(4*nage))+I(cos(4*nage))
j <- simconboot(nage,height,lm,formula)
k <- rconint(j)
plot(k, border=NA, col='darkgray',xlab = 'Age (years)',ylab = 'Height (cms)',xaxt = "n")
axis(1, at = seq(-2*pi*min(age)/(max(age)-min(age)), 
        2*pi+1,by=5*2*pi/(max(age)-min(age))), label = seq(0, max(age)+1, by=5))
polygon.conint(j, border=NA, col='lightgray')
polygon.conint(k, border=NA, col='darkgray', density=50)
points(nage,height,col='gray80')
legend(min(nage),max(height),c("95\% CI Original",
       "95\% CI  Rearranged"),lty=c(1,1),lwd=c(2,2),
       col=c("lightgray","darkgray"),bty="n");
detach(GrowthChart)
}
}
\keyword{ optimize }
\keyword{manip}
\keyword{regression}
\keyword{models}
