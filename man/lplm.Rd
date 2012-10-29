\name{lplm}
\alias{lplm}

\title{
Local Linear Regression Methods for Conditional Mean Functions
}
\description{
Implements the local nonparametric method, local linear regression estimator with box kernel (default), for conditional mean functions. 


}
\usage{
lplm(x, y, h, xx)
}

\arguments{
  \item{x}{The conditioning covariate}
  \item{y}{The response variable }
  \item{h}{The bandwidth parameter }
  \item{xx}{The points at which the function is to be estimated }  
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

\examples{
data(GrowthChart)
attach(GrowthChart)

ages <- unique(sort(age))
lplm.fit1 <- lplm(age,height,h=1,xx=ages)

detach(GrowthChart)
}

\keyword{ regression}