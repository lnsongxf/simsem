\name{anova}
\alias{anova,SimResult-method}
\title{
	Provide a comparison of nested models and nonnested models across replications
}
\description{
	This function will provide averages of model fit statistics and indices for nested models. It will also provide average differences of fit indices and power for likelihood ratio tests of nested models.
}
\arguments{
  \item{object}{
	\code{\linkS4class{SimResult}} object being described. Currently at least two objects must be included as arguments
}
  \item{\dots}{
    any additional arguments, such as additional objects or for the function with result object
}
}
\value{
	A data frame that provides the statistics described above from all parameters.
	For using with \code{linkS4class{SimResult}}, the result is a list with two or three elements:
	\itemize{
		\item \code{summary:} Average of fit indices across all replications
		\item \code{diff:} Average of the differences in fit indices across all replications
		\item \code{varyParam:} The statistical power of chi-square difference test given values of varying parameters (such as sample size or percent missing) 
	}
}
\author{
    Alexander M. Schoemann (East Carolina University; \email{schoemanna@ecu.edu}), 
	Sunthud Pornprasertmanit (\email{psunthud@gmail.com})
}

\seealso{
	\code{\linkS4class{SimResult}} for the object input
}
\examples{
\dontrun{
loading1 <- matrix(0, 6, 1)
loading1[1:6, 1] <- NA
loading2 <- loading1
loading2[6,1] <- 0
LY1 <- bind(loading1, 0.7)
LY2 <- bind(loading2, 0.7)
RPS <- binds(diag(1))
RTE <- binds(diag(6))
CFA.Model1 <- model(LY = LY1, RPS = RPS, RTE = RTE, modelType="CFA")
CFA.Model2 <- model(LY = LY2, RPS = RPS, RTE = RTE, modelType="CFA")

# We make the examples running only 5 replications to save time.
# In reality, more replications are needed.
# Need to make sure that both simResult calls have the same seed!
Output1 <- sim(5, n=500, model=CFA.Model1, generate=CFA.Model1, seed=123567)
Output2 <- sim(5, n=500, model=CFA.Model2, generate=CFA.Model1, seed=123567)
anova(Output1, Output2)

# The example when the sample size is varying
Output1b <- sim(NULL, n=seq(50, 500, 50), model=CFA.Model1, generate=CFA.Model1, seed=123567)
Output2b <- sim(NULL, n=seq(50, 500, 50), model=CFA.Model2, generate=CFA.Model1, seed=123567)
anova(Output1b, Output2b)
}
}
