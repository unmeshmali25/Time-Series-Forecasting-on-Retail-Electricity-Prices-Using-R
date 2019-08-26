# Reading data onto a data frame
retailPrices <- read.csv("RetailPrices.csv", row.names = NULL)

retailPrices <- retailPrices[,1]

retailPrices <- na.omit(retailPrices)

# Creating a time series of the retial prices
ts_retail <- ts(retailPrices, start = c(1976,01), frequency = 12)
plot(ts_retail) 

decomposedRes <- decompose(ts_retail, type="mult") 
plot (decomposedRes) # see plot below

stlRes <- stl(ts_retail, s.window = "periodic")
acfRes <- acf(ts_retail)
pacfRes <- pacf(ts_retail)

# How to de-trend a time series
trModel <- lm(ts_retail ~ c(1:length(ts_retail)))
# plot(trModel) 
plot(resid(trModel), type="l")  # resid(trModel) contains the de-trended series.