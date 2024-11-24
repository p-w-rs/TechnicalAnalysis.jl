### Volatility Indicator Functions ###
# real = ATR(high, low, close, timeperiod=14)
function ATR(df; period=14)
    ind = talib.ATR(df[!, "high"], df[!, "low"], df[!, "close"], timeperiod=period)
    insertcols!(df, length(propertynames(df)) + 1, "atr-$period" => ind)
end

# real = NATR(high, low, close, timeperiod=14)
function NATR(df; period=14)
    ind = talib.NATR(df[!, "high"], df[!, "low"], df[!, "close"], timeperiod=period)
    insertcols!(df, length(propertynames(df)) + 1, "natr-$period" => ind)
end

# real = TRANGE(high, low, close)
function TRANGE(df)
    ind = talib.TRANGE(df[!, "high"], df[!, "low"], df[!, "close"])
    insertcols!(df, length(propertynames(df)) + 1, "trange" => ind)
end