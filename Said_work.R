library(tidyverse)
ac_imf <- read.csv("ac_imf.csv")


#Forming separate data frames for each country:

Algeria_data <- ac_imf %>% filter(country=="Algeria")
Angola_data <- ac_imf %>% filter(country=="Angola")
Cent_Afr_Rep_data <- ac_imf %>% filter(country=="Central African Republic")
Egypt_data <- ac_imf %>% filter(country=="Egypt")
Iv_Coast_data <- ac_imf %>% filter(country=="Ivory Coast")
Kenya_data <- ac_imf %>% filter(country=="Kenya")
Mauritius_data <- ac_imf %>% filter(country=="Mauritius")
Morocco_data <- ac_imf %>% filter(country=="Morocco")
Nigeria_data <- ac_imf %>% filter(country=="Nigeria")
South_Afr_data <- ac_imf %>% filter(country=="South Africa")
Tunisia_data <- ac_imf %>% filter(country=="Tunisia")
Zambia_data <- ac_imf %>% filter(country=="Zambia")
Zimbabwe_data <- ac_imf %>% filter(country=="Zimbabwe")

# If we regress occurrence of systemic crisis on other type of economic crisis by using simple lm function, we
# can see that only banking crisis and sovereign external debt default have positive significant coefficients. 


regress0 <- lm(systemic_crisis ~ domestic_debt_in_default + sovereign_external_debt_default +
                 currency_crises + inflation_crises + banking_crisis   , data = ac_imf)
summary(regress0)

# The results show that 80% of the time banking crisis result in systemic crisis. Sovereign debt default does
# not have as big impact as banking crisis do on systemic crisis but still it has some direct effect. 
# So in this part, I would like to focus on sovereign debt default and its deriving factors because in addition 
# its direct relation with systemic crisis it is argued in literature sovereign debt default is also
# related with other type of crisis such as inflation crisis.
# Thus, considering the available qualitative variables in our data, two variables, namely, export price index 
# and exchange rate possible deriving factors of sovereign because these countries' economies heavily depend
# on their export revenues. 
# For that purpose we run correlation test for the entire data set first.

mycorr_test <- function(x,y) {
  z <- cor.test(x, y, method = "pearson")
  w <- round(matrix(c(z$estimate, z$p.value), nrow=1, ncol=2), 3)
  colnames(w) <- c("Corr", "  P Value")
  return(w)
}

mycorr_test(ac_imf$exch_usd, as.numeric(ac_imf$sovereign_external_debt_default))
mycorr_test(ac_imf$inflation_annual_epi, as.numeric(ac_imf$sovereign_external_debt_default))

# Correlation tests on entire data set suggest that there is significant positive correlation between exchange 
# rate and sovereign debt crisis, which means increasing USD exchange rate is correlated with occurrence of   
# sovereign debt crisis.
# On the other hand, there is also significant negative correlation between export price index and 
# sovereign debt crisis, which makes sense because these decreasing export prices causes trade deficits
# and decrease in government revenues which possibly lead to sovereign debt crisis.

# At the next step, we perform the correlation tests for each of 13 countries separately to explore which of 
# exchange rate and export price index is a more explanatory factor for sovereign debt crisis

## Algeria:
mycorr_test(Algeria_data$exch_usd, as.numeric(Algeria_data$sovereign_external_debt_default))
mycorr_test(Algeria_data$inflation_annual_epi, as.numeric(Algeria_data$sovereign_external_debt_default))


## Angola:
mycorr_test(Angola_data$exch_usd, as.numeric(Angola_data$sovereign_external_debt_default))
mycorr_test(Angola_data$inflation_annual_epi, as.numeric(Angola_data$sovereign_external_debt_default))


## Central African Republic:
mycorr_test(Cent_Afr_Rep_data$exch_usd, as.numeric(Cent_Afr_Rep_data$sovereign_external_debt_default))
mycorr_test(Cent_Afr_Rep_data$inflation_annual_epi, as.numeric(Cent_Afr_Rep_data$sovereign_external_debt_default))


## Egypt:
mycorr_test(Egypt_data$exch_usd, as.numeric(Egypt_data$sovereign_external_debt_default))
mycorr_test(Egypt_data$inflation_annual_epi, as.numeric(Egypt_data$sovereign_external_debt_default))


## Ivory Coast
mycorr_test(Iv_Coast_data$exch_usd, as.numeric(Iv_Coast_data$sovereign_external_debt_default))
mycorr_test(Iv_Coast_data$inflation_annual_epi, as.numeric(Iv_Coast_data$sovereign_external_debt_default))


## Kenya:
mycorr_test(Kenya_data$exch_usd, as.numeric(Kenya_data$sovereign_external_debt_default))
mycorr_test(Kenya_data$inflation_annual_epi, as.numeric(Kenya_data$sovereign_external_debt_default))


## Mauritis:
mycorr_test(Mauritius_data$exch_usd, as.numeric(Mauritius_data$sovereign_external_debt_default))
mycorr_test(Mauritius_data$inflation_annual_epi, as.numeric(Mauritius_data$sovereign_external_debt_default))


## Morocco:
mycorr_test(Morocco_data$exch_usd, as.numeric(Morocco_data$sovereign_external_debt_default))
mycorr_test(Morocco_data$inflation_annual_epi, as.numeric(Morocco_data$sovereign_external_debt_default))


## Nigeria:
mycorr_test(Nigeria_data$exch_usd, as.numeric(Nigeria_data$sovereign_external_debt_default))
mycorr_test(Nigeria_data$inflation_annual_epi, as.numeric(Nigeria_data$sovereign_external_debt_default))


## South Africa:
mycorr_test(South_Afr_data$exch_usd, as.numeric(South_Afr_data$sovereign_external_debt_default))
mycorr_test(South_Afr_data$inflation_annual_epi, as.numeric(South_Afr_data$sovereign_external_debt_default))


## Tunisia:
mycorr_test(Tunisia_data$exch_usd, as.numeric(Tunisia_data$sovereign_external_debt_default))
mycorr_test(Tunisia_data$inflation_annual_epi, as.numeric(Tunisia_data$sovereign_external_debt_default))


## Zambia:
mycorr_test(Zambia_data$exch_usd, as.numeric(Zambia_data$sovereign_external_debt_default))
mycorr_test(Zambia_data$inflation_annual_epi, as.numeric(Zambia_data$sovereign_external_debt_default))


# Zimbabwe:
mycorr_test(Zimbabwe_data$exch_usd, as.numeric(Zimbabwe_data$sovereign_external_debt_default))
mycorr_test(Zimbabwe_data$inflation_annual_epi, as.numeric(Zimbabwe_data$sovereign_external_debt_default))


# Correlation tests for each country proves that export price index is a better predictor for sovereign debt 
# crisis than exchange rate for the most of the countries although the correlation between exchange rate and 
# occurrence of sovereign debt crisis is bigger in magnitude in aggregate level.
# Only for Egypt and Tunisia, export price index is not explanatory for sovereign debt crisis but there is also 
# no significant correlation between exchange rate and occurrence of sovereign debt crisis for these countries.
# Only for Zimbabwe, exchange rate is better predictor than export price index.
# Additionally, since Mauritius have never experienced sovereign debt crisis correlation test do not work for
# Mauritius.

# As I mentioned before, according to some macroeconomic studies, sovereign debt default is also related to
# inflation crisis.
# From this perspective, we investigate whether there is a sign of correlation between sovereign debt crisis and
# inflation crisis for these 13 African countries:

mycorr_test(as.numeric(ac_imf$inflation_crises), as.numeric(ac_imf$sovereign_external_debt_default))


# At the aggregate level and also for the most of the countries there is significant relation between 
# sovereign debt crisis and inflation crisis. We know that exchange rate and export price index are main drivers
# of sovereign debt. At this point we would like to explore whether they are also correlated with inflation  rate
# or not


## Algeria:
mycorr_test(Algeria_data$inflation_annual_cpi, Algeria_data$exch_usd)
mycorr_test(Algeria_data$inflation_annual_cpi, Algeria_data$inflation_annual_epi)

## Angola:
mycorr_test(Angola_data$inflation_annual_cpi, Angola_data$exch_usd)
mycorr_test(Angola_data$inflation_annual_cpi, Angola_data$inflation_annual_epi)

## Central African Republic:
mycorr_test(Cent_Afr_Rep_data$inflation_annual_cpi, Cent_Afr_Rep_data$exch_usd)
mycorr_test(Cent_Afr_Rep_data$inflation_annual_cpi, Cent_Afr_Rep_data$inflation_annual_epi)

## Egypt:
mycorr_test(Egypt_data$inflation_annual_cpi, Egypt_data$exch_usd)
mycorr_test(Egypt_data$inflation_annual_cpi, Egypt_data$inflation_annual_epi)

## Ivory Coast:
mycorr_test(Iv_Coast_data$inflation_annual_cpi, Iv_Coast_data$exch_usd)
mycorr_test(Iv_Coast_data$inflation_annual_cpi, Iv_Coast_data$inflation_annual_epi)


## Kenya:
mycorr_test(Kenya_data$inflation_annual_cpi, Kenya_data$exch_usd)
mycorr_test(Kenya_data$inflation_annual_cpi, Kenya_data$inflation_annual_epi)

## Mauritis:
mycorr_test(Mauritius_data$inflation_annual_cpi, Mauritius_data$exch_usd)
mycorr_test(Mauritius_data$inflation_annual_cpi, Mauritius_data$inflation_annual_epi)

## Morocco:
mycorr_test(Morocco_data$inflation_annual_cpi, Morocco_data$exch_usd)
mycorr_test(Morocco_data$inflation_annual_cpi, Morocco_data$inflation_annual_epi)

## Nigeria:
mycorr_test(Nigeria_data$inflation_annual_cpi, Nigeria_data$exch_usd)
mycorr_test(Nigeria_data$inflation_annual_cpi, Nigeria_data$inflation_annual_epi)

## South Africa:
mycorr_test(South_Afr_data$inflation_annual_cpi, South_Afr_data$exch_usd)
mycorr_test(South_Afr_data$inflation_annual_cpi, South_Afr_data$inflation_annual_epi)

## Tunisia:
mycorr_test(Tunisia_data$inflation_annual_cpi, Tunisia_data$exch_usd)
mycorr_test(Tunisia_data$inflation_annual_cpi, Tunisia_data$inflation_annual_epi)

## Zambia:
mycorr_test(Zambia_data$inflation_annual_cpi, Zambia_data$exch_usd)
mycorr_test(Zambia_data$inflation_annual_cpi, Zambia_data$inflation_annual_epi)

# Zimbabwe:
mycorr_test(Zimbabwe_data$inflation_annual_cpi, Zimbabwe_data$exch_usd)
mycorr_test(Zimbabwe_data$inflation_annual_cpi, Zimbabwe_data$inflation_annual_epi)


# We found that for some countries there is significant correlation between exchange rate and inflation rate
# and for some other countries there is correlation between export price index and inflation. 
# Especially for some countries such as Algeria, Angola, Zambia, the negative correlation between
# export price index and inflation can be seen easily by visual inspection:

ac_imf %>% filter(country=="Angola") %>% ggplot(aes(x=inflation_annual_cpi, y=inflation_annual_epi)) + 
  geom_point()

ac_imf %>% filter(country=="Algeria") %>% ggplot(aes(x=inflation_annual_cpi, y=inflation_annual_epi)) + 
  geom_point()

ac_imf %>% filter(country=="Zambia") %>% ggplot(aes(x=inflation_annual_cpi, y=inflation_annual_epi)) + 
  geom_point()



# Next step is to do regression analysis for these 3 qualitative variables: inflation rate, export price index 
# and exchange rate.


regress1 <- lm(inflation_annual_cpi ~ exch_usd + inflation_annual_epi, data = ac_imf)
summary(regress1)


# Thus, according to the outcome of the simple linear regression there is no significant coefficient estimate 
# at the aggregate level.
# Next, we run fixed effect regression to be able to control country specific factors from each other, assuming 
# that each country has its own intercept value for the average level of their inflation 


regress2 <- lm(inflation_annual_cpi ~ exch_usd + inflation_annual_epi + factor(country) - 1, data = ac_imf)
summary(regress2)


# But, still we do not get any significant coefficient estimate with fixed-effect regression. 


# Furthermore we know that banking and systemic crisis in these 13 countries overwhelmingly took place after
# their independency.Also we explored that there is strong correlation between exchange rate and inflation for 
# most of the countries in the data set. In this context another question  we would like to answer is whether 
# the becoming independent triggered higher inflation rates or not. Most of these countries became independence
# mid 1960s.
# To investigate the answer of this question we set about 20 years of control period of time. Thus, we run the
# regression on the data after 1945. Additionally, since there is quite a lot  fluctuation in inflation rate 
# after the mid 1980s, we limited the data until 1985. By this way we set about 20 years of control period of 
# time and 20 years of treatment period of time:

indep_sample <- ac %>% filter(year > "1945-01-01", year < "1985-01-01", inflation_annual_cpi !=0, exch_usd !=0)
indep_sample$independence <- as.numeric(indep_sample$independence)

regress3 <- lm(inflation_annual_cpi ~  exch_usd + independence + factor(country) -1, data = indep_sample)
summary(regress3)


# The regression result suggests that most of the countries experienced rise in their inflation rates
# after becoming independent, 2.8% on average. Algeria, Angola, and Nigeria are the most negatively affected 
# countries, their average inflation rate increased more than 10% after being independent.

