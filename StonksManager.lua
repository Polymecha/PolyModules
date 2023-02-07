local StonksManager = {}

--This function sets the starting amount of money in the stock market
function SetStartingAmount(amount)
	--Make sure amount is a valid value
	assert(type(amount) == "number")
	--Set the starting amount of money in the market
	MoneyAvailable = amount
end

--This function processes a stock buy transaction for a stock
function BuyStock(stock, count, price)
	--Make sure the stock is valid
	assert(type(stock) == "string")
	--Make sure the count is valid
	assert(type(count) == "number")
	--Make sure the price is valid
	assert(type(price) == "number")
	--Retrieve the current stock price
	local currentPrice = StockPrice[stock]
	--Make sure the buying price is the same as the current price
	assert(currentPrice == price)
	--Calculate the total cost of the transaction
	local totalCost = count * price
	--Make sure thereâs enough money in the market
	assert(MoneyAvailable >= totalCost)
	--Calculate the amount of money remaining in the market
	MoneyAvailable = MoneyAvailable - totalCost
	--Add the stock to the list of owned stocks
	local currentCount = OwnedStocks[stock]
	--If it doesnât exist, set the count to 0
	if not currentCount then
		currentCount = 0
	end
	--Increment the count of owned stocks
	OwnedStocks[stock] = currentCount + count
	--Return the amount of money remaining in the market
	return MoneyAvailable
end

--This function processes a stock sell transaction for a stock
function SellStock(stock, count, price)
	--Make sure the stock is valid
	assert(type(stock) == "string")
	--Make sure the count is valid
	assert(type(count) == "number")
	--Make sure the price is valid
	assert(type(price) == "number")
	--Retrieve the current stock price
	local currentPrice = StockPrice[stock]
	--Make sure the selling price is the same as the current price
	assert(currentPrice == price)
	--Calculate the total amount of money gained from the transaction
	local moneyGained = count * price
	--Add the money to the market
	MoneyAvailable = MoneyAvailable + moneyGained
	--Retrieve the current stock count
	local currentCount = OwnedStocks[stock]
	--Make sure the count isn't more than owned
	assert(currentCount >= count)
	--Decrement the count of owned stocks
	OwnedStocks[stock] = currentCount - count
	--Return the amount of money in the market
	return MoneyAvailable
end

--This function sets the price of a stock
function SetStockPrice(stock, price)
	--Make sure the stock is valid
	assert(type(stock) == "string")
	--Make sure the price is valid
	assert(type(price) == "number")
	--Set the price of the stock
	StockPrice[stock] = price
end

--This function retrieves the price of a stock
function GetStockPrice(stock)
	--Make sure the stock is valid
	assert(type(stock) == "string")
	--Retrieve the price of the stock
	return StockPrice[stock]
end

--This function retrieves the amount of money available in the stock market
function GetMoneyAvailable()
	--Return the amount of money available in the stock market
	return MoneyAvailable
end

return StonksManager
