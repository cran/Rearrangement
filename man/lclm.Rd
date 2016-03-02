\name{lclm}
\alias{lclm}
\title{
Local Constant Estimator for Conditional Mean Functions
}
\description{
Implements the local nonparametric method kernel estimator--with box kernel (default), for conditional mean functions.
}
\usage{
lclm(x, y, h, xx)
}

%- maybe also 'usage' for other objects documented here.
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
lclm.fit1 <- lclm(age,height,h=1,xx=ages)

detach(GrowthChart)
}

\keyword{ regression }
