# Forming separate data frames for each country:

Algeria_data <- ac_imf %>% filter(country=="Algeria")
Angola_data <- ac_imf %>% filter(country=="Angola")
Cent_Afr_Rep_data <- ac_imf %>% filter(country=="Central African Republic")
Egypt_data <- ac_imf %>% filter(country=="Egypt")
Kenya_data <- ac_imf %>% filter(country=="Kenya")
Mauritius_data <- ac_imf %>% filter(country=="Mauritius")
Morocco_data <- ac_imf %>% filter(country=="Morocco")
Nigeria_data <- ac_imf %>% filter(country=="Nigeria")
South_Afr_data <- ac_imf %>% filter(country=="South Africa")
Tunisia_data <- ac_imf %>% filter(country=="Tunisia")
Zambia_data <- ac_imf %>% filter(country=="Zambia")
Zimbabwe_data <- ac_imf %>% filter(country=="Zimbabwe")


# First we look at which of export price index and exchange rate is better in explaining sovereign debt crisis
# For that purpose we run correlation test for the entire data set first.


cor.test(ac_imf$exch_usd, as.numeric(ac_imf$sovereign_external_debt_default), method = "pearson")
cor.test(ac_imf$inflation_annual_epi, as.numeric(ac_imf$sovereign_external_debt_default), method = "pearson")

# Correlation tests on entire data set suggest that there is significant positive correlation between exchange 
# rate and sovereign debt crisis, which means increasing USD exchange rate is correlated with occurrence of   
# sovereign debt crisis.
# On the other hand, there is significant negative correlation between decreasing export price index and 
# sovereign debt crisis, which makes sense because these African countries are mainly commodity exporters, 
# that is, their economies mostly rely on their export revenues. Decreasing export prices causes trade deficits, 
# which are expected to create sovereign debt crisis.

# At the next step, we perform the correlation tests for each of 13 countries separately to explore which of 
# exchange rate and export price index is a more explanatory for sovereign debt crisis

## Algeria:
cor.test(Algeria_data$exch_usd, as.numeric(Algeria_data$sovereign_external_debt_default), method = "pearson")
cor.test(Algeria_data$inflation_annual_epi, as.numeric(Algeria_data$sovereign_external_debt_default), method = "pearson")


## Angola:
cor.test(Angola_data$exch_usd, as.numeric(Angola_data$sovereign_external_debt_default), method = "pearson")
cor.test(Angola_data$inflation_annual_epi, as.numeric(Angola_data$sovereign_external_debt_default), method = "pearson")


## Central African Republic:
cor.test(Cent_Afr_Rep_data$exch_usd, as.numeric(Cent_Afr_Rep_data$sovereign_external_debt_default), method = "pearson")
cor.test(Cent_Afr_Rep_data$inflation_annual_epi, as.numeric(Cent_Afr_Rep_data$sovereign_external_debt_default), method = "pearson")


## Egypt:
cor.test(Egypt_data$exch_usd, as.numeric(Egypt_data$sovereign_external_debt_default), method = "pearson")
cor.test(Egypt_data$inflation_annual_epi, as.numeric(Egypt_data$sovereign_external_debt_default), method = "pearson")


## Kenya:
cor.test(Kenya_data$exch_usd, as.numeric(Kenya_data$sovereign_external_debt_default), method = "pearson")
cor.test(Kenya_data$inflation_annual_epi, as.numeric(Kenya_data$sovereign_external_debt_default), method = "pearson")


## Mauritis:
cor.test(Mauritius_data$exch_usd, as.numeric(Mauritius_data$sovereign_external_debt_default), method = "pearson")
cor.test(Mauritius_data$inflation_annual_epi, as.numeric(Mauritius_data$sovereign_external_debt_default), method = "pearson")


## Morocco:
cor.test(Morocco_data$exch_usd, as.numeric(Morocco_data$sovereign_external_debt_default), method = "pearson")
cor.test(Morocco_data$inflation_annual_epi, as.numeric(Morocco_data$sovereign_external_debt_default), method = "pearson")


## Nigeria:
cor.test(Nigeria_data$exch_usd, as.numeric(Nigeria_data$sovereign_external_debt_default), method = "pearson")
cor.test(Nigeria_data$inflation_annual_epi, as.numeric(Nigeria_data$sovereign_external_debt_default), method = "pearson")


## South Africa:
cor.test(South_Afr_data$exch_usd, as.numeric(South_Afr_data$sovereign_external_debt_default), method = "pearson")
cor.test(South_Afr_data$inflation_annual_epi, as.numeric(South_Afr_data$sovereign_external_debt_default), method = "pearson")


## Tunisia:
cor.test(Tunisia_data$exch_usd, as.numeric(Tunisia_data$sovereign_external_debt_default), method = "pearson")
cor.test(Tunisia_data$inflation_annual_epi, as.numeric(Tunisia_data$sovereign_external_debt_default), method = "pearson")


## Zambia:
cor.test(Zambia_data$exch_usd, as.numeric(Zambia_data$sovereign_external_debt_default), method = "pearson")
cor.test(Zambia_data$inflation_annual_epi, as.numeric(Zambia_data$sovereign_external_debt_default), method = "pearson")


# Zimbabwe:
cor.test(Zimbabwe_data$exch_usd, as.numeric(Zimbabwe_data$sovereign_external_debt_default), method = "pearson")
cor.test(Zimbabwe_data$inflation_annual_epi, as.numeric(Zimbabwe_data$sovereign_external_debt_default), method = "pearson")


# Correlation tests for each country proves that export price index is a better predictor for sovereign debt 
# crisis than exchange rate for the most of the countries although the correlation between exchange rate and 
# occurrence of sovereign debt crisis is bigger in magnitude than the correlation between export price index
# and occurrence of sovereign debt crisis in aggregate level.
# Only for Egypt and Tunisia, export price index is not explanatory for sovereign debt crisis but there is also 
# no significant correlation between exchange rate and occurrence of sovereign debt crisis for these countries.
# Only for Zimbabwe, exchange rate is better predictor than export price index.
# Additionally, since Mauritius have never experienced sovereign debt crisis correlation test do not work for
# Mauritius.


# Next, we investigate the correlation between sovereign debt crisis and inflation crisis:

cor.test(as.numeric(ac_imf$inflation_crises), as.numeric(ac_imf$sovereign_external_debt_default), method = "pearson")


## Algeria:
cor.test(as.numeric(Algeria_data$inflation_crises), as.numeric(Algeria_data$sovereign_external_debt_default), method = "pearson")


## Angola:
cor.test(as.numeric(Angola_data$inflation_crises), as.numeric(Angola_data$sovereign_external_debt_default), method = "pearson")


## Central African Republic:
cor.test(as.numeric(Cent_Afr_Rep_data$inflation_crises), as.numeric(Cent_Afr_Rep_data$sovereign_external_debt_default), method = "pearson")



## Egypt:
cor.test(as.numeric(Egypt_data$inflation_crises), as.numeric(Egypt_data$sovereign_external_debt_default), method = "pearson")



## Kenya:
cor.test(as.numeric(Kenya_data$inflation_crises), as.numeric(Kenya_data$sovereign_external_debt_default), method = "pearson")



## Mauritis:
cor.test(as.numeric(Mauritius_data$inflation_crises), as.numeric(Mauritius_data$sovereign_external_debt_default), method = "pearson")



## Morocco:
cor.test(as.numeric(Morocco_data$inflation_crises), as.numeric(Morocco_data$sovereign_external_debt_default), method = "pearson")



## Nigeria:
cor.test(as.numeric(Nigeria_data$inflation_crises), as.numeric(Nigeria_data$sovereign_external_debt_default), method = "pearson")



## South Africa:
cor.test(as.numeric(South_Afr_data$inflation_crises), as.numeric(South_Afr_data$sovereign_external_debt_default), method = "pearson")



## Tunisia:
cor.test(as.numeric(Tunisia_data$inflation_crises), as.numeric(Tunisia_data$sovereign_external_debt_default), method = "pearson")



## Zambia:
cor.test(as.numeric(Zambia_data$inflation_crises), as.numeric(Zambia_data$sovereign_external_debt_default), method = "pearson")



# Zimbabwe:
cor.test(as.numeric(Zimbabwe_data$inflation_crises), as.numeric(Zimbabwe_data$sovereign_external_debt_default), method = "pearson")


# For the most of those countries that experienced inflation crisis there is significant relation between 
# sovereign debt crisis and inflation crisis. At this point we would like to explore that which of exchange rate 
#and export price index is more correlated with inflation rate. 



## Algeria:
cor.test(Algeria_data$inflation_annual_cpi, Algeria_data$exch_usd, method = "pearson")
cor.test(Algeria_data$inflation_annual_cpi, Algeria_data$inflation_annual_epi, method = "pearson")

## Angola:
cor.test(Angola_data$inflation_annual_cpi, Angola_data$exch_usd, method = "pearson")
cor.test(Angola_data$inflation_annual_cpi, Angola_data$inflation_annual_epi, method = "pearson")

## Central African Republic:
cor.test(Cent_Afr_Rep_data$inflation_annual_cpi, Cent_Afr_Rep_data$exch_usd, method = "pearson")
cor.test(Cent_Afr_Rep_data$inflation_annual_cpi, Cent_Afr_Rep_data$inflation_annual_epi, method = "pearson")

## Egypt:
cor.test(Egypt_data$inflation_annual_cpi, Egypt_data$exch_usd, method = "pearson")
cor.test(Egypt_data$inflation_annual_cpi, Egypt_data$inflation_annual_epi, method = "pearson")

## Kenya:
cor.test(Kenya_data$inflation_annual_cpi, Kenya_data$exch_usd, method = "pearson")
cor.test(Kenya_data$inflation_annual_cpi, Kenya_data$inflation_annual_epi, method = "pearson")

## Mauritis:
cor.test(Mauritius_data$inflation_annual_cpi, Mauritius_data$exch_usd, method = "pearson")
cor.test(Mauritius_data$inflation_annual_cpi, Mauritius_data$inflation_annual_epi, method = "pearson")

## Morocco:
cor.test(Morocco_data$inflation_annual_cpi, Morocco_data$exch_usd, method = "pearson")
cor.test(Morocco_data$inflation_annual_cpi, Morocco_data$inflation_annual_epi, method = "pearson")

## Nigeria:
cor.test(Nigeria_data$inflation_annual_cpi, Nigeria_data$exch_usd, method = "pearson")
cor.test(Nigeria_data$inflation_annual_cpi, Nigeria_data$inflation_annual_epi, method = "pearson")

## South Africa:
cor.test(South_Afr_data$inflation_annual_cpi, South_Afr_data$exch_usd, method = "pearson")
cor.test(South_Afr_data$inflation_annual_cpi, South_Afr_data$inflation_annual_epi, method = "pearson")

## Tunisia:
cor.test(Tunisia_data$inflation_annual_cpi, Tunisia_data$exch_usd, method = "pearson")
cor.test(Tunisia_data$inflation_annual_cpi, Tunisia_data$inflation_annual_epi, method = "pearson")

## Zambia:
cor.test(Zambia_data$inflation_annual_cpi, Zambia_data$exch_usd, method = "pearson")
cor.test(Zambia_data$inflation_annual_cpi, Zambia_data$inflation_annual_epi, method = "pearson")

# Zimbabwe:
cor.test(Zimbabwe_data$inflation_annual_cpi, Zimbabwe_data$exch_usd, method = "pearson")
cor.test(Zimbabwe_data$inflation_annual_cpi, Zimbabwe_data$inflation_annual_epi, method = "pearson")


# We found that there is significant negative correlation between exchange rate and inflation. Next step is to do regression analysis for inflation rate, export price index and exchange rate.


regress1 <- lm(inflation_annual_cpi ~ exch_usd + inflation_annual_epi, data = ac_imf)
summary(regress1)


# Thus, there is no significant coefficient estimate at the aggregate level.
# Next, we run fixed effect regression to be able to distinguish country specific factors from each other.


regress2 <- lm(inflation_annual_cpi ~ exch_usd + inflation_annual_epi + factor(country) - 1, data = ac_imf)
summary(regress2)


# Still we do not get any significant result. Thus, we can conclude that we need more variables and data to
# to preform regression analysis. On the other hand, by looking at fixed effect estimates of each country we can
# conclude that Kenya and Zimbabwe have higher level of inflation than other countries on average.

# On the other hand, we can regress occurrence of systemic crisis on other type of economic crisis by using
# fixed effect approach:

regress3 <- lm(systemic_crisis ~ domestic_debt_in_default + sovereign_external_debt_default +
                 currency_crises + inflation_crises + banking_crisis  + factor(country) - 1 , data = ac_imf)
summary(regress3)

## The results show that 77% of the time banking crisis and systemic crisis occur at the same time. On the other 
# only 5% of sovereign debt crisis are followed by systemic crisis. Another striking finding is, domestic debt 
# crisis actually are negatively correlated with systemic crisis. When a country experience a domestic debt crisis
# it is 20% percent less likely that it would also experience a systemic crisis compared to those times
# when the country does not experience a domestic debt crisis.


# Furthermore we know that banking and systemic crisis in these 13 countries overwhelmingly took place after
# their independency.Also we explored that there is strong correlation between exchange rate and inflation for 
# most of the countries in the data set. In this context another question  we would like to answer is whether 
# the gaining independency triggered higher inflation rates or not. Most of these countries became independence
# mid 1960s.
# To investigate the answer of this question we set about 20 years of control period of time. Thus, we run the
# regression on the data after 1945. Additionally, since there is quite a lot  fluctuation in inflation rate 
# after the mid 1980s, we limited the data until 1985. By this way wet about 20 years of control period of time
# and 20 years of treatment period of time:

indep_sample <- ac %>% filter(year > "1945-01-01", year < "1985-01-01", inflation_annual_cpi !=0, exch_usd !=0)
indep_sample$independence <- as.numeric(indep_sample$independence)

regress4 <- lm(inflation_annual_cpi ~  exch_usd + independence + factor(country) -1, data = indep_sample)
summary(regress4)


# The regression result suggests that the independence have 2.8% increasing impact on inflation on overage.





