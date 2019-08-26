# Reading data onto a data frame
retailPrices <- read.csv("AverageRetailPrice.csv", row.names = NULL)
retailPrices <- subset(retailPrices, select = c("X.5"))
retailPrices <- tail(retailPrices, -11)
names(retailPrices) <- "Average electricity retail price (cents/kWh)"
retailPrices <- retialPrices[,1]
head(retailPrices, 10)
ts_retail <- ts(retailPrices, start = c(1976,01), frequency = 12)
plot(ts_retail)