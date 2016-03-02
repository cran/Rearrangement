\name{GrowthChart}
\alias{GrowthChart}
\docType{data}
\title{Age and Height of White Males}
\description{
This data set contains age and height of US-born white males age two through twenty. Note that age is measured in months and expressed in years, and height is measured in centimeters.
}
\usage{data(GrowthChart)}
\format{
  A data frame with 533 observations on the following 3 variables.
  \describe{
    \item{\code{sex}}{a numeric vector. Male = 1}
    \item{\code{height}}{a numeric vector. Height in cm}
    \item{\code{age}}{a numeric vector. Age in years}
  }
}

\source{
 The data consist of repeated cross sectional measurements of height and age from the 2003-2004 National Health and Nutrition Survey collected by the US National Center for Health Statistics.
}

\examples{
data(GrowthChart)
attach(GrowthChart)
plot(age,height,pch=21,bg='gray',cex=.5,
xlab="Age (years)",ylab="Height (cms)",col='gray')
detach(GrowthChart)
}

\keyword{datasets}
