\name{lcrq2}
\alias{lcrq2}

\title{Local Constant Estimator for Conditional Quantile Functions}
\description{
Implements the local nonparametric method kernel estimator--with box kernel (default), for conditional quantile functions.
This is a modification of Koenker's \code{\link[quantreg]{lprq}} (from package \pkg{quantreg}). 
}
\usage{
lcrq2(x, y, h, xx, tau)
}

\arguments{  
  \item{x}{The conditioning covariate}
  \item{y}{The response variable }
  \item{h}{The bandwidth parameter }
  \item{xx}{The points at which the function is to be estimated }
  \item{tau}{The quantile(s) to be estimated. This should be a list of quantiles if the function estimates the quantile process}
}

\details{
The function uses a box kernel.
}
\value{
  \item{xx}{The design points at which the evaluation occurs}
	\item{fitted.values}{The estimated function values at these design points}
}
\author{
Wesley Graybill, Mingli Chen, Victor Chernozhukov, Ivan Fernandez-Val, Alfred Galichon
}

\seealso{
\code{\link[quantreg]{lprq}}
}
\examples{
require(quantreg)
data(GrowthChart)
attach(GrowthChart)

ages <- unique(sort(age))
lcq.fit1 <- lcrq2(age,height,h=1,xx=ages,tau=0.01)

detach(GrowthChart)
}

\keyword{ regression }