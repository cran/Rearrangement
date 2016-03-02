\name{Rearrangement-package}
\alias{Rearrangement-package}
\alias{Rearrangement}
\docType{package}
\title{
Point and Interval Rearrangement
}
\description{
This package implements the rearrangement operator (Hardy, Littlewood, and Polya 1952) for univariate, bivariate, and trivariate point estimates of monotonic functions. It additionally provides a function that creates simultaneous confidence intervals for univariate functions and applies the rearrangement operator to these confidence intervals.
}
\details{
\tabular{ll}{
Package: \tab Rearrangement\cr
Type: \tab Package\cr
Version: \tab 1.0\cr
Date: \tab 2011-09-11\cr
License: \tab GPL(>=2)\cr
LazyLoad: \tab yes\cr
}
This package is used for rearranging both point and interval estimates of a target function. Given an original point estimate of a target function, one may use \code{\link{rearrangement}} to monotonize this estimate. One may also create simultaneous confidence interval estimates using \code{\link{simconboot}} and monotonize these estimates using \code{\link{rconint}}.

}
\author{
Wesley Graybill, Mingli Chen, Victor Chernozhukov, Ivan Fernandez-Val, Alfred Galichon

Maintainer: Ivan Fernandez-Val <ivanf@bu.edu>
}
\references{
Chernozhukov, V., I. Fernandez-Val, and a. Galichon. 2009. Improving point and interval estimators of monotone functions by rearrangement. Biometrika 96 (3): 559-575. 

Chernozhukov, V., I. Fernandez-Val, and a. Galichon. 2010. Quantile and Probability Curves Without Crossing. Econometrica 78(3): 1093-1125.

Hardy, G.H., J.E. Littlewood, and G. Polya, Inequalities,2nd ed, Cambridge U. Press,1952

}

\keyword{ package }
\keyword{ manip }
\keyword{ datasets }
\keyword{regression}
\keyword{models}

\examples{
##rearrangement example:
library(splines)
data(GrowthChart)
attach(GrowthChart)

ages <- unique(sort(age))
aknots <- c(3, 5, 8, 10, 11.5, 13, 14.5, 16, 18)
splines_age <- bs(age,kn=aknots)
sformula <- height~splines_age
sfunc <- approxfun(age,lm(sformula)$fitted.values)
splreg <- sfunc(ages)
rsplreg <- rearrangement(list(ages),splreg)
plot(age,height,pch=21,bg='gray',cex=.5,xlab="Age(years)",
ylab="Height(cms)", main="CEF (Regression Splines)",col='gray')
lines(ages,splreg,col='red',lwd=3)
lines(ages,rsplreg,col='blue',lwd=2)
legend("topleft",c('Original','Rearranged'),lty=1,col=c('red','blue'),bty='n')
detach(GrowthChart)

##rconint example:
\dontrun{
data(GrowthChart)
attach(GrowthChart)

nage <- 2 * pi * (age - min(age)) / (max(age) - min(age))

formula <- height~I(sin(nage))+I(cos(nage))+I(sin(2*nage)) +
            I(cos(2*nage))+I(sin(3*nage))+
            I(cos(3*nage))+ I(sin(4*nage)) + I(cos(4*nage))
			
j <- simconboot(nage,height,lm,formula)
k <- rconint(j)
plot(k, border=NA, col='darkgray')
polygon.conint(j, border=NA, col='lightgray')
polygon.conint(k, border=NA, col='darkgray', density=50)
points(nage,height)
detach(GrowthChart)
}
}
